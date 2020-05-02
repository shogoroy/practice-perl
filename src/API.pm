package API;

use strict;
use warnings;
use utf8;

sub top {
  my ($req) = @_;

  my $res = $req->new_response(200);
  $res->content_type('text/html');
  $res->body('Hello');

  return $res;
}

1;
