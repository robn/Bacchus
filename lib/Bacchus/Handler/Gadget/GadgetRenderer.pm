package Bacchus::Handler::Gadget::GadgetRenderer;

use 5.010;

use namespace::clean;

use Moose;
use MooseX::Method::Signatures;
use LWP::UserAgent;

method get ( ClassName $class: HashRef $env, HashRef[Str] :$args? = {} ) {
    confess "required argument 'url' not provided" if not $args->{url};

    # XXX some shared/user-specified ua?
    my $ua = LWP::UserAgent->new;

    # XXX get it from a cache?
    my $res = $ua->get($args->{url});
    confess "gadget fetch failed: ".$res->status_line if !$res->is_success;

    my $g = Bacchus::Gadget->new_from_xml($res->content);
    return [200, [], [$g->render]];
}

__PACKAGE__->meta->make_immutable;

1;

__END__
