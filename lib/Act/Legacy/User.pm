package Act::Legacy::User;

use namespace::clean;

use Moo;

with 'Act::Role::Legacy';

# basic attributes
has [ Act::Schema->source('User')->columns ] => ( is => 'ro' );

1;
