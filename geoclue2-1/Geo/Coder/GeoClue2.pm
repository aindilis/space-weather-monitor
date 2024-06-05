package Geo::Coder::GeoClue2;

use strict;
use warnings;
use Geo::Coder::GeoClue2::Manager;

sub new {
  my ($class, %params) = @_;
  my $self = bless {}, $class;

  $self->{desktop_id} = $params{desktop_id} || 'your-app-name';
  $self->{accuracy} = $params{accuracy} || 'city';

  $self->{manager} = Geo::Coder::GeoClue2::Manager->new();
  $self->{client} = $self->{manager}->get_client($self->{desktop_id});
  # ... rest of the code ...
  return $self;
}

sub location {
    my ($self) = @_;

    my $location = $self->{client}->get_location();

    return undef unless $location;

    return {
        latitude  => $location->get_latitude(),
        longitude => $location->get_longitude(),
    };
}

sub _accuracy_level {
    my ($self, $accuracy) = @_;

    return {
        country => Geo::Coder::GeoClue2::AccuracyLevel->COUNTRY,
        city    => Geo::Coder::GeoClue2::AccuracyLevel->CITY,
        street  => Geo::Coder::GeoClue2::AccuracyLevel->STREET,
        exact   => Geo::Coder::GeoClue2::AccuracyLevel->EXACT,
    }->{$accuracy} || Geo::Coder::GeoClue2::AccuracyLevel->CITY;
}

package Geo::Coder::GeoClue2::Master;

use Glib::Object::Introspection;

# Load the GeoClue2 library
Glib::Object::Introspection->setup(
    basename => 'Geoclue',
    version  => '2.0',
    package  => 'Geo::Coder::GeoClue2',
);

sub new {
    my ($class) = @_;
    my $self = bless {}, $class;

    $self->{master} = Geo::Coder::GeoClue2::Manager::get_default();

    return $self;
}

sub create_client {
    my ($self, $desktop_id) = @_;

    my $client = $self->{master}->get_client($desktop_id);

    return $client;
}

1;
