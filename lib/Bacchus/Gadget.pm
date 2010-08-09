package Bacchus::Gadget;

use 5.010;

use namespace::autoclean;

use Moose;
use MooseX::Method::Signatures;

use XML::Tiny qw(parsefile);

method new_from_xml ( ClassName $class: Str $xml ) {
    my %args;

    return $class->new(%args);
}

method render () {
    return "";
}

__PACKAGE__->meta->make_immutable;

1;

__END__
