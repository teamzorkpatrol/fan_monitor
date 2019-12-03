#!/bin/bash
if [[ $(uname | grep Darwin) ]]; then

if ! [[ -f $(grep SMC fan_monitor | head -n 1 | cut -f2 -d'"') ]]; 
then
echo Building smc...
cd smc-command
make || exit 1
sudo chown root:wheel smc
sudo chmod ugo+x smc
echo Installing smc in /usr/local/bin...
sudo cp smc /usr/local/bin/
cd ..
else
    echo smc is already installed, not building it
fi
echo Installing fan_monitor...
sudo cp fan_monitor /usr/local/bin/
sudo cp com.beerbabesandbsd.fan_monitor.plist /Library/LaunchDaemons/
sudo chmod ugo+rx /usr/local/bin/fan_monitor
sudo chown root:wheel /usr/local/bin/fan_monitor
sudo chmod ugo+r /Library/LaunchDaemons/com.beerbabesandbsd.fan_monitor.plist
sudo chown root:wheel /Library/LaunchDaemons/com.beerbabesandbsd.fan_monitor.plist
echo Done! Reboot your Mac.

else
    echo "This script is for Mac OS X, Howard."
fi
