package Act::Role::Storage::DBIC;

use Act::Schema;
use Module::Runtime qw( require_module );
use namespace::clean;

use Moo::Role;

requires 'config';

with qw(
    Act::Interface::Act
    Act::Interface::Storage
);

has _schema => ( is => 'lazy' );

sub _build__schema {
    Act::Schema->connect(
        @{ shift->config->{endpoint} }{qw( uri user pass )} );
}

my $entity_to_source = {
     Person => 'User',
};

sub _translate_query {
    my ( $self, $entity_type, $query ) = @_;
    return ( $entity_to_source->{$entity_type}, $query, {} );
}

sub search_raw {
    my ( $self, $entity_type, $query ) = @_;

    my ( $source_name, $dbic_query, $dbic_opts )
        = $self->_translate_query( $entity_type, $query );

    my $transformer = "Act::Transformer::$entity_type";
    require_module($transformer);

    return $self->_schema->resultset($source_name)
        ->search_rs( $dbic_query, $dbic_opts )
        ->search( {}, { result_class => $transformer->new( act => $self ) } )
        ->all;
}

1;
