package Act::Legacy::Talk;

use Moo;

with 'Act::Role::Legacy';

# basic attributes
has [ Act::Schema->source('Talk')->columns ] => ( is => 'ro' );

1;
