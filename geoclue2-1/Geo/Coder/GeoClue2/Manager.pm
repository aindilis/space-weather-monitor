package Geo::Coder::GeoClue2::Manager;

our $VERSION = 0.1;

use strict;
use warnings;
use Carp;

require XSLoader;
XSLoader::load('Geo::Coder::GeoClue2::Manager', $VERSION);

sub new {
  my ($class) = @_;
  my $self = bless {}, $class;
  $self->{manager} = Geo::Coder::GeoClue2::Manager::get_default();
  return $self;
}

sub get_client {
  my ($self, $desktop_id) = @_;
  my $client = Geo::Coder::GeoClue2::Manager::get_client($self->{manager}, $desktop_id);
  return $client;
}

1;
