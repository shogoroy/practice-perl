use strict;
use warnings;
use utf8;

use Plack::Request;
use Plack::Response;
use Data::Dumper;
use HTTP::Router::Declare;

use API;

my $router = router {
  match '/', { method => 'GET' }, to { app => \&API::top }
};

sub dispatch {
  my ($req) = @_;
  my $match = $router->match($req) or return $req->new_response(404)->finalize;
  return $match->params->{ app }($req, $match)->finalize;
}

my $app = sub {
  my $req = Plack::Request->new(shift);
  my $r = eval { dispatch($req) };
  my $errstr = $@ or return $r;

  warn $errstr;

  my $res = $req->new_response(503);
  $res->content_type('text/html');
  $res->body('Error');

  return $res->finalize;
};
