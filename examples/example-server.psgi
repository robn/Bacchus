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
        my $method = lc $env->{REQUEST_METHOD};

        if ($p->{class}->can($method)) {
            my $ret = eval { $p->{class}->$method($env) };
            if ($@) {
                print STDERR $@;
                return [501, [], ['internal server error']];
            }
            return $ret;
        }

        return [405, [], ['method not allowed']];
    }

    return [404, [], ['not found']];
}
