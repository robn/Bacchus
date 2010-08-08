#!/usr/bin/env plackup

use 5.010;

use warnings;
use strict;

use Bacchus;
use Router::Simple::Declare;

my $r = router {
    connect '/gadgets/ifr', { class => 'Bacchus::Handler::Gadget::GadgetRenderer' };
};

my $app = sub {
    my ($env) = @_;

    if (my $p = $r->match($env)) {
        eval "require $p->{class}";
        if ($@) {
            print STDERR $@;
            return [500, [], ['internal server error']];
        }

        my $method = lc $env->{REQUEST_METHOD};
        return $p->{class}->$method($env) if $p->{class}->can($method);

        return [405, [], ['method not allowed']];
    }

    return [404, [], ['not found']];
}
