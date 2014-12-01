package Act::Transformer::Person;

use Moo;

with 'Act::Role::Transformer';

sub inflate_result {
    my ( $self, undef, $me, $prefetch ) = @_;
    return { _legacy_data => $me };
}

1;
