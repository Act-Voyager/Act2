package Act::Role::Entity;

use Moo::Role;

with 'Act::Role::WithAct';

requires 'entity_type';

1;

__END__

=head1 NAME

Act::Role::Entity - A role for Act entities

=head1 DESCRIPTION

    package Act::Entity::Person;

    with qw(
         Act::Role::Entity
         Act::Interface::Person
    );

    sub entity_type { 'Person' }

    1;

=head1 DESCRIPTION

The Act::Role::Entity provides the basic behaviour for entities.

=head1 REQUIRED METHODS

=head2 entity_type

The "type" of the Act entity.

=cut
