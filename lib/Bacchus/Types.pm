package Bacchus::Types;

use 5.010;

use namespace::autoclean;

use MooseX::Types -declare => [qw(
    GadgetFeature
)];

use MooseX::Types::Moose qw(Str);

class_type Gadget,             { class => 'Bacchus::Gadget' };
class_type GadgetFeature,      { class => 'Bacchus::Gadget::Feature' };
class_type GadgetOAuthService, { class => 'Bacchus::Gadget::OAuthService' };

__PACKAGE__->meta->make_immutable;

1;

__END__
