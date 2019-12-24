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
sudo chmod ugo+r-x /Library/LaunchDaemons/com.beerbabesandbsd.fan_monitor.plist
sudo chown root:wheel /Library/LaunchDaemons/com.beerbabesandbsd.fan_monitor.plist

echo 

echo "Note: You will probably need to configure the temp keys for your Mac."
echo 
echo "You can do that using iStats or using smc. iStats will give you more information"
echo "but smc is quicker."
echo 
echo "$ gem install iStats"
echo "$ istats scan"
echo 
echo or...
echo
echo '$ smc -l | grep "  T"'
echo 
echo The keys beginning TC and TG are for your CPU and GPU respectively.
echo Find the keys you want then edit fan_monitor and replace them in the KEYS variable.
echo 
echo Also you may want to modify the setfan function if your machine has only one fan.
echo Try...
echo '$ smc -f | grep "  F"'
echo 
echo $ sudo vim /usr/local/bin/fan_monitor
echo

echo "Reboot your Mac when you're finished configuring."

else
    echo "This script is for Mac OS X, Howard."
fi
