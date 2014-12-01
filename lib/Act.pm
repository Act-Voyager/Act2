package Act;

use Path::Class;
use File::HomeDir;
use YAML::Tiny qw( LoadFile );
use Module::Runtime qw( require_module );
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

    my @with = qw( Act::Interface::Storage );

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
    my ( $self, $entity_type, $query ) = @_;
    my $entity_class = "Act::Entity::$entity_type";
    require_module($entity_class);
    return [
        map $entity_class->new( %$_, act => $self ),
        shift->search_raw( $entity_type, $query )
    ];
}

sub get_entity {
    my ( $self, $entity_type, $query ) = @_;
    my ( $entity, @more ) = @{ $self->find_entities( $entity_type, $query ) };
    die "Got more than one $entity_type entity with @_" if @more;
    return $entity;
}

sub save_entity {
    my ( $self, $entity ) = @_;
    ...;
}

1;
