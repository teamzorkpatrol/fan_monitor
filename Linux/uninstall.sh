#!/bin/bash
echo Removing...
sudo rc-service fan_monitor stop
sudo rc-update delete fan_monitor 
sudo rm -f /usr/local/bin/fan_monitor
sudo rm -f /etc/init.d/fan_monitor
echo Done.
