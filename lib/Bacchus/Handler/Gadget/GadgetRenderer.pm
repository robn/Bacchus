package Bacchus::Handler::Gadget::GadgetRenderer;

use 5.010;

use namespace::clean;

use Moose;
use MooseX::Method::Signatures;

method get ( ClassName $class: HashRef $env, HashRef[Str] :$args? = {} ) {
    use Data::Dumper;
    return [200, [], [Dumper($args)]];
}

__PACKAGE__->meta->make_immutable;

1;

__END__
