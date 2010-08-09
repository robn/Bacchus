package Bacchus::Gadget::Feature;

use Moose;
use MooseX::Types::Moose qw(Str HashRef);

has name => ( is => "ro", isa => Str, required => 1 );

has _params => (
    traits   => ["Hash"],
    is       => "ro",
    isa      => HashRef[Str],
    init_arg => "params",
    default  => sub { {} },
    handles  => {
        params => "elements",
        param  => "get",
    },
);

__PACKAGE__->meta->make_immutable;

1;

__END__
