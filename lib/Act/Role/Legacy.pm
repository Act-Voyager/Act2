package Act::Role::Legacy;

use Moo::Role;

with 'Act::Role::WithAct';

sub BUILD {
    my ($self) = @_;
    die "Not in a legacy context"
        unless $self->act->does('Act::Role::Storage::DBIC');
}

1;
