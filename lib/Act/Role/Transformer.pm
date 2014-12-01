package Act::Role::Transformer;

use Moo::Role;

with 'Act::Role::WithAct';

sub inflate_result {
    my ( $self, undef, $me, $prefetch ) = @_;
    return $me;
}

1;
