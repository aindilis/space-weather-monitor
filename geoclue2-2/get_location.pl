#!/usr/bin/perl

use strict;
use warnings;
use JSON;

# Check if location service is enabled
my $location_enabled = `gsettings get org.gnome.system.location enabled`;
chomp $location_enabled;

# Enable location service if not already enabled
if ($location_enabled ne 'true') {
    system('gsettings set org.gnome.system.location enabled true');
}

# Run the where-am-i script
my $output = `/usr/libexec/geoclue-2.0/demos/where-am-i -t 1`;

# Parse the output
my ($latitude, $longitude, $accuracy, $speed, $heading, $timestamp);

if ($output =~ /Latitude:\s+([\d.-]+)°/m) {
    $latitude = $1;
}

if ($output =~ /Longitude:\s+([\d.-]+)°/m) {
    $longitude = $1;
}

if ($output =~ /Accuracy:\s+([\d.]+)\s+meters/m) {
    $accuracy = $1;
}

if ($output =~ /Speed:\s+([\d.]+)\s+meters\/second/m) {
    $speed = $1;
}

if ($output =~ /Heading:\s+([\d.]+)°/m) {
    $heading = $1;
}

if ($output =~ /Timestamp:\s+(.+)\s+\((\d+)\s+seconds\s+since\s+the\s+Epoch\)/m) {
    $timestamp = {
        'human_readable' => $1,
        'epoch_seconds' => $2
    };
}

# Construct the JSON object
my $location_data = {
    'latitude' => $latitude,
    'longitude' => $longitude,
    'accuracy' => $accuracy,
    'speed' => $speed,
    'heading' => $heading,
    'timestamp' => $timestamp
};

# Convert the data to JSON format
my $json_output = to_json($location_data, { pretty => 1 });

# Print the JSON output
print $json_output;

# Disable location service if it was initially disabled
if ($location_enabled ne 'true') {
    system('gsettings set org.gnome.system.location enabled false');
}
