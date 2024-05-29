#!/usr/bin/perl

use strict;
use warnings;
use WWW::Mechanize;
use Email::Sender::Simple qw(sendmail);
use Email::Simple;
use Email::Simple::Creator;

# URLs for the forecasts
my $url_27day = 'https://www.swpc.noaa.gov/products/27-day-outlook-107-cm-radio-flux-and-geomagnetic-indices';
my $url_3day_forecast = 'https://www.swpc.noaa.gov/products/3-day-forecast';
my $url_3day_geomagnetic = 'https://www.swpc.noaa.gov/products/3-day-geomagnetic-forecast';

# Email configuration
my $from = 'sender@example.com';
my $to = 'recipient@example.com';

# Create a new Mechanize object
my $mech = WWW::Mechanize->new();

# Fetch the data from the URLs
my $data_27day = fetch_data($url_27day);
my $data_3day_forecast = fetch_data($url_3day_forecast);
my $data_3day_geomagnetic = fetch_data($url_3day_geomagnetic);

# Parse the data and extract relevant information
my $parsed_data_27day = parse_27day_data($data_27day);
my $parsed_data_3day_forecast = parse_3day_forecast_data($data_3day_forecast);
my $parsed_data_3day_geomagnetic = parse_3day_geomagnetic_data($data_3day_geomagnetic);

# Determine the overall threat level
my $threat_level = determine_threat_level($parsed_data_27day, $parsed_data_3day_forecast, $parsed_data_3day_geomagnetic);

# Send notification if the threat level exceeds a certain threshold
if ($threat_level >= 3) {
  send_notification($threat_level);
}

sub fetch_data {
  my ($url) = @_;
  $mech->get($url);
  return $mech->content;
}

sub parse_27day_data {
  my ($data) = @_;
  # Parse the 27-day outlook data and return the parsed information
  # You'll need to implement this based on the actual data format
}

sub parse_3day_forecast_data {
  my ($data) = @_;
  # Parse the 3-day forecast data and return the parsed information
  # You'll need to implement this based on the actual data format
}

sub parse_3day_geomagnetic_data {
  my ($data) = @_;
  # Parse the 3-day geomagnetic forecast data and return the parsed information
  # You'll need to implement this based on the actual data format
}

sub determine_threat_level {
  my ($data_27day, $data_3day_forecast, $data_3day_geomagnetic) = @_;
  # Implement logic to determine the overall threat level based on the parsed data
  # Return an integer representing the threat level (e.g., 1-5)
}

sub send_notification {
  my ($threat_level) = @_;

  # Get the username of the logged-in user
  my $username = get_logged_in_user();

  if ($username) {
    # Try sending a desktop notification using notify-send
    my $dbus_session_bus_address = get_dbus_session_bus_address($username);
    if ($dbus_session_bus_address) {
      my $notify_send_cmd = "DBUS_SESSION_BUS_ADDRESS=$dbus_session_bus_address notify-send 'Space Weather Alert' 'Threat Level: $threat_level'";
      system($notify_send_cmd);
    }

    # Send an email notification
    my $subject = "Space Weather Alert: Threat Level $threat_level";
    my $body = "The current space weather conditions indicate a threat level of $threat_level.";

    my $email = Email::Simple->create(
				      header => [
						 From    => $from,
						 To      => "$username\@localhost",
						 Subject => $subject,
						],
				      body => $body,
				     );

    sendmail($email);
  }
}

sub get_logged_in_user {
  # Get the username of the logged-in user
  my $logged_in_user = `who | awk '{print \$1}' | head -n 1`;
  chomp $logged_in_user;
  return $logged_in_user;
}

sub get_dbus_session_bus_address {
  my ($username) = @_;

  # Get the DBUS_SESSION_BUS_ADDRESS for the specified user
  my $dbus_session_bus_address = `su - $username -c 'echo \$DBUS_SESSION_BUS_ADDRESS'`;
  chomp $dbus_session_bus_address;

  return $dbus_session_bus_address;
}
