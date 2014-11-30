package Act::Interface::Act;

use Moo::Role;

requires qw(
    find_entities
    get_entity
    save_entity
);

1;

__END__

=head1 NAME

Act::Interface::Act - The interface of the Act class

=head1 DESCRIPTION

=head1 REQUIRED METHODS

=head2 find_entities

    $act->find_entities( $entity_type => \%query );

=head2 get_entity

    $act->get_entity( $entity_type => \%query );

=head2 save_entity

    $act->save_entity( $entity_type => $entity );

=cut
