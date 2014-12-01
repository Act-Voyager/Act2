package Act::Entity::Person;

use Moo;

with qw(
    Act::Interface::Person
    Act::Role::Entity
    Act::Role::WithLegacy
);

sub entity_type {'Person'}

sub _build_legacy {
    my ($self) = @_;
    require Act::Legacy::User;
    return Act::Legacy::User->new(
        act => $self->act,
        %{ $self->_legacy_data },
    );
}

sub name {
    my $legacy = shift->legacy;
    return join ' ', $legacy->first_name, $legacy->last_name,
        $legacy->nick_name && '(' . $legacy->nick_name . ')';
}

sub short_name {
    my $legacy = shift->legacy;
    return join ' ', $legacy->first_name, $legacy->last_name;
}

sub formal_name { shift->short_name }

1;
