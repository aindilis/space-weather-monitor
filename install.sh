#!/bin/bash

# Reload the systemd daemon to pick up the new configuration 

sudo systemctl daemon-reload

# Enable and start the timer:

sudo systemctl enable space_weather_alert.timer
sudo systemctl start space_weather_alert.timer

# This will enable the timer to start automatically on system boot and start the timer immediately.
# You can check the status of the timer and the associated service using the following commands:

sudo systemctl status space_weather_alert.timer
sudo systemctl status space_weather_alert.service
