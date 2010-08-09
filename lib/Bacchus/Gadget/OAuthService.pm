package Bacchus::Gadget::OAuthService;

use 5.010;

use Moose;
use MooseX::Types::Moose qw(Str);

has name => ( is => "ro", isa => Str, default => '' );

has request_url            => ( is => "ro", isa => Str,                                         required => 1 );
has request_method         => ( is => "ro", isa => Str,                                         default  => "POST" );
has resuest_param_location => ( is => "ro", isa => enum([qw(uri-query auth-header post-body)]), default  => "auth-header" );

has access_url            => ( is => "ro", isa => Str,                                         required => 1 );
has access_method         => ( is => "ro", isa => Str,                                         default  => "POST" );
has access_param_location => ( is => "ro", isa => enum([qw(uri-query auth-header post-body)]), default  => "auth-header" );

has authorization_url => ( is => "ro", isa => Str, required => 1 );

__PACKAGE__->meta->make_immutable;

1;

__END__
