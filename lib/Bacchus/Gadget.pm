package Bacchus::Gadget;

use 5.010;

use namespace::autoclean;

use Moose;
use MooseX::Method::Signatures;
use MooseX::Types::Moose qw(Str);

use Bacchus::Gadget::Feature;
use Bacchus::Types qw(GadgetFeature);

use XML::Tiny qw(parsefile);

has title              => ( is => "ro", isa => Str, default => '' );
has author             => ( is => "ro", isa => Str, default => '' );
has author_email       => ( is => "ro", isa => Str, default => '' );
has description        => ( is => "ro", isa => Str, default => '' );
has directory_title    => ( is => "ro", isa => Str, default => '' );
has screenshot         => ( is => "ro", isa => Str, default => '' );
has thumbnail          => ( is => "ro", isa => Str, default => '' );
has title_url          => ( is => "ro", isa => Str, default => '' );
has author_affiliation => ( is => "ro", isa => Str, default => '' );
has author_location    => ( is => "ro", isa => Str, default => '' );
has author_photo       => ( is => "ro", isa => Str, default => '' );
has author_aboutme     => ( is => "ro", isa => Str, default => '' );
has author_quote       => ( is => "ro", isa => Str, default => '' );
has author_link        => ( is => "ro", isa => Str, default => '' );
has show_stats         => ( is => "ro", isa => Str, default => '' );
has show_in_directory  => ( is => "ro", isa => Str, default => '' );
has width              => ( is => "ro", isa => Str, default => '' );
has height             => ( is => "ro", isa => Str, default => '' );
has category           => ( is => "ro", isa => Str, default => '' );
has category2          => ( is => "ro", isa => Str, default => '' );
has singleton          => ( is => "ro", isa => Str, default => '' );
has render_inline      => ( is => "ro", isa => Str, default => '' );
has scaling            => ( is => "ro", isa => Str, default => '' );
has scrolling          => ( is => "ro", isa => Str, default => '' );

has icon               => ( is => "ro", isa => Str, default => '' );

has _required_features => (
    traits   => ["Hash"],
    is       => "ro",
    isa      => HashRef[GadgetFeature],
    init_arg => "required_features",
    default  => sub { {} },
    handles  => {
        required_features => 'keys',
        required_feature  => 'get',
    },
);

has _optional_features => (
    traits   => ["Hash"],
    is       => "ro",
    isa      => HashRef[GadgetFeature],
    init_arg => "optional_features",
    default  => sub { {} },
    handles  => {
        optional_features => 'keys',
        optional_feature  => 'get',
    },
);

has _oauth_services => (
    traits   => ["Hash"],
    is       => "ro",
    isa      => HashRef[GadgetOAuthService],
    init_arg => "oauth_services",
    default  => sub { {} },
    handles  => {
        oauth_services => 'keys',
        oauth_service  => 'get',
    },
);

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
