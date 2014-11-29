package Act;

use Path::Class;
use File::HomeDir;
use YAML::Tiny qw( LoadFile );
use namespace::clean;

use Moo;

has bootstrap_config_file => (
    is      => 'ro',
    default => sub { dir( File::HomeDir->my_data, 'act.yml' ) },
);

has config => ( is => 'lazy', );

sub _build_config { LoadFile( shift->bootstrap_config_file ); }

sub BUILD {
    my ($self) = @_;

    my @with;

    # storage layer
    my ($scheme) = split /:/, $self->config->{endpoint}{uri};
    push @with, 'Act::Role::Storage::DBIC' if $scheme eq 'dbi';
    push @with, 'Act::Role::Storage::REST' if $scheme =~ /^https?$/;

    require Role::Tiny;
    Role::Tiny->apply_roles_to_object( $self, @with ) if @with;

    return $self;
}

# entities
sub find_entities {
    my ( $self, $entity_name, @args ) = @_;
    return [
        map "Act::Entity::$entity_name"->new($_),
        shift->search_raw( $entity_name, @args )
    ];
}

sub get_entity {
    my ( $self, $entity_name, @args ) = @_;
    my ( $entity, @more ) = @{ $self->find_entities( $entity_name, @args ) };
    die "Got more than one $entity_name entity with @_" if @more;
    return $entity;
}

sub save_entity {
    my ( $self, $entity ) = @_;
    ...;
}

1;
