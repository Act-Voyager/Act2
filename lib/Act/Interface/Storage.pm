package Act::Interface::Storage;

use Moo::Role;

requires 'search_raw';

1;

__END__

=head1 NAME

Act::Interface::Storage - Act storage interface

=head1 DESCRIPTION

Act::Interface::Storage defines the interface an Act::Role::Storage::
role must implement.

=head1 REQUIRED METHODS

=head2 search_raw

    $act->search_raw( $entity_type => \%query );

Return a hash reference with the data needed to inflate entities.

=cut
