package Act::Interface::Person;

use Moo::Role;

requires qw(
    name
    short_name
    formal_name
);

1;

__END__

=head1 NAME

Act::Interface::Person - The Act Person interface

=head1 SYNOPSIS

     package Act::Entity::Person;

     use Moo;

     with qw(
         Act::Role::Entity
         Act::Interface::Person
     );

     # required by Act::Role::Entity
     sub entity_type { 'Person' }

     # required by Act::Interface::Person
     sub name { ... }

     sub short_name { ... }

     sub formal_name { ... }

=head1 DESCRIPTION

Act::Entity::Person represents a person in Act.

=head1 REQUIRED METHODS

=head2 name

The person's full name.

=head2 short_name

A shorter version of the person's name (possibly more familiar).

=head2 formal_name

The person's full formal name (e.g. including title).

=cut
