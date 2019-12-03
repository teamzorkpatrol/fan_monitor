#!/bin/bash
echo Removing...
sudo launchctl stop com.beerbabesandbsd.fan_monitor
sudo rm -f /usr/local/bin/fan_monitor
sudo rm -f /usr/local/bin/smc
sudo rm -f /Library/LaunchDaemons/com.beerbabesandbsd.fan_monitor.plist
echo Done.
