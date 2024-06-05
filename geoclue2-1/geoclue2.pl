#!/usr/bin/env perl

use strict;
use warnings;
use lib '/usr/lib/x86_64-linux-gnu/girepository-1.0';  # Adjust the path according to your system"

use Geo::Coder::GeoClue2;

my $geoclue = Geo::Coder::GeoClue2->new(
					desktop_id => 'space-weather-alert',
					accuracy => 'city',
				       );

my $location = $geoclue->location;

if ($location) {
  my $latitude  = $location->{latitude};
  my $longitude = $location->{longitude};

  print "Latitude: $latitude, Longitude: $longitude\n";
}
else {
  print "Failed to retrieve location.\n";
}
