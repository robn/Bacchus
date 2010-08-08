#!/usr/bin/env plackup

use 5.010;

use warnings;
use strict;

use Bacchus;
use CGI::Simple;
use Router::Simple::Declare;

my $r = router {
    connect '/gadgets/ifr', { class => 'Bacchus::Handler::Gadget::GadgetRenderer' };
};

my $app = sub {
    my ($env) = @_;

    my $p = $r->match($env);
    return [404, [], ['not found']] if not $p;

    my $method = lc $env->{REQUEST_METHOD};

    if ($method eq 'post' and exists $env->{HTTP_X_HTTP_METHOD_OVERRIDE}) {
        $method = lc $env->{HTTP_X_HTTP_METHOD_OVERRIDE};
        return [405, [], ['method not allowed']] if $method !~ m/^get|post|put|delete|head$/;
    }

    return [405, [], ['method not allowed']] if not $p->{class}->can($method);

    my $q = CGI::Simple->new($env->{QUERY_STRING});

    my $ret = eval { $p->{class}->$method($env, query => { $q->Vars(',') }) };
    if ($@) {
        print STDERR $@;
        return [501, [], ['internal server error']];
    }

    return $ret;
}
