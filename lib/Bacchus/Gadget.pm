package Bacchus::Gadget;

use 5.010;

use namespace::autoclean;

use Moose;
use MooseX::Method::Signatures;

use XML::Tiny qw(parsefile);

method new_from_xml ( ClassName $class: Str $xml ) {
    my %args;

    my $data = parsefile("_TINY_XML_STRING_".$xml);
    use Data::Dumper;
    print Dumper $data;

    return $class->new(%args);
}

method render () {
    return "";
}

__PACKAGE__->meta->make_immutable;

1;

__END__
