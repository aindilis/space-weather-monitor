# Space Weather Alert System

The Space Weather Alert System is a Perl script that fetches space weather data from NOAA (National Oceanic and Atmospheric Administration) and sends notifications to users when the threat level exceeds a certain threshold. The script is designed to run as a systemd service on Debian 12 and can send notifications via desktop notifications and email.

## Features

- Fetches space weather data from NOAA's 27-day outlook, 3-day forecast, and 3-day geomagnetic forecast
- Parses the fetched data to extract relevant information
- Determines the overall threat level based on the parsed data
- Sends desktop notifications to logged-in users using `notify-send`
- Sends email notifications to users as a fallback
- Runs as a systemd service on a daily basis

## Prerequisites

- Perl 5
- Required Perl modules:
  - `WWW::Mechanize`
  - `Email::Sender::Simple`
  - `Email::Simple`
  - `Email::Simple::Creator`
- `notify-send` command (for desktop notifications)
- Debian 12 or a compatible Linux distribution

## Installation

1. Clone the repository or download the script files:
   ```
   git clone https://github.com/username/space-weather-alert.git
   ```

2. Install the required Perl modules if not already installed:
   ```
   sudo cpan WWW::Mechanize Email::Sender::Simple Email::Simple Email::Simple::Creator
   ```

3. Copy the `space_weather_alert.pl` script to `/usr/local/bin/`:
   ```
   sudo cp space_weather_alert.pl /usr/local/bin/
   ```

4. Create the systemd service file:
   ```
   sudo cp space_weather_alert.service /etc/systemd/system/
   ```

5. Create the systemd timer file:
   ```
   sudo cp space_weather_alert.timer /etc/systemd/system/
   ```

6. Reload the systemd daemon:
   ```
   sudo systemctl daemon-reload
   ```

7. Enable and start the timer:
   ```
   sudo systemctl enable space_weather_alert.timer
   sudo systemctl start space_weather_alert.timer
   ```

## Configuration

- Modify the `$from` and `$to` variables in the `space_weather_alert.pl` script to set the sender and recipient email addresses for email notifications.

- Adjust the threat level threshold in the `space_weather_alert.pl` script if needed. By default, notifications are sent when the threat level is 3 or higher.

## Usage

The Space Weather Alert System will automatically run as a systemd service on a daily basis once installed and configured. You can check the status of the timer and the associated service using the following commands:

```
sudo systemctl status space_weather_alert.timer
sudo systemctl status space_weather_alert.service
```

Desktop notifications will be sent to logged-in users using `notify-send`, and email notifications will be sent to the configured recipient email address.

## License

This project is licensed under the [GPL](LICENSE).

## Acknowledgements

- Space weather data provided by NOAA's Space Weather Prediction Center (SWPC)
- Perl modules used: `WWW::Mechanize`, `Email::Sender::Simple`, `Email::Simple`, `Email::Simple::Creator`

## Contact

For any questions or suggestions, please open an issue on the GitHub repository.
