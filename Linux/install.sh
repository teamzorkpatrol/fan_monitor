#!/bin/bash

if [[ $(uname | grep Linux) ]]; then

echo Installing fan_monitor in /usr/local/bin/...
sudo cp fan_monitor /usr/local/bin/
sudo chown root:root /usr/local/bin/fan_monitor
sudo chmod 0744 /usr/local/bin/fan_monitor


if [[ $(sudo which openrc) ]]; then
    echo Installing init...
    sudo cp fan_monitor.init /etc/init.d/fan_monitor
    sudo chown root:root /etc/init.d/fan_monitor
    sudo chmod 0744 /etc/init.d/fan_monitor
    sudo rc-update add fan_monitor default
    echo
    echo You can reboot now or start the service by hand. 
    echo Remember to remove mbpfan or macfanctl if you have them installed. 
    echo
    echo sudo rc-service fan_monitor start
else
    echo "I can't find openrc. You'll have to install the init yourself, or add to /etc/rc.local:"
    echo 
    echo "/usr/local/bin/fan_monitor &"
    echo "exit 0"
fi

else
    echo "This is for Linux. You're not running the right shell script, Howard."
fi
