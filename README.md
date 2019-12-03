# fan_monitor 

**An easily configurable fan monitor/controller for Mac OS X/macOS and Linux**

The problem with modern Macs is that they suck. 

They're badly designed with no air holes, fans that never turn on when they should, GPUs that overheat and die, etc. And that's just the hardware.

## Some Background

Because I needed a laptop with Firewire support, I bought a MacBook Pro 17-inch, Early 2011 (MacBookPro8,3). Little did I know that this MBP had a graphics card that fails when it gets too hot. I found that out when I used MacPorts.

The Macbook Pro's fans set on automatic just plain suck. They doesn't cool worth beans. So I had to find software that would keep my Mac cool. I found smcFanControl (https://github.com/hholtmann/smcFanControl), but I was not happy with it. What's worse is that during my experiments, I managed to kill one of the fans. I didn't want to spend any more money on a machine that was probably going to die on me one of these days, so what could I do other than get an external fan? Write my own program. 

Luckily, smcFanControl included smc.c, the source to the awesome program to control the Mac's SMC. With that, I could disable one fan and control the other while checking the temperature.

All I needed to do was to write a BASH script that would keep my Mac cool. That's fan_monitor.

### Instructions

> cd Mac # for OS X, Linux for... uh... Linux
> sudo ./install.sh

Now reboot your Mac and get a celebratory beer!

(Note that this has only been tested on El Capitan, Mavericks, and Snow Leopard. If launchd won't launch it, you'll have to modify the plist yourself. I stopped upgrading my Macbook Pro after Apple abandoned me, so you're on your own if you're running macOS Foobar.)

**Notes for Linux:**

The init was designed for OpenRC. If you're using systemd, you might be able to add fan_monitor to rc.local, assuming that the systemd developers haven't decided to "improve" on simplicity. Try adding this to rc.local before it exits:

/usr/local/bin/fan_monitor &

If it doesn't work, file a complaint-- or better yet-- _upgrade_ to Devuan or Artix.


### Frequently Annoying Questions/Complaints:


**1. How do I configure it?**

**Mac OS X/Linux**

Edit the fan_control script in your favorite text editor and modify the arrays. The default settings are:

RANGE=(95 84 70 50 0)
FAN1=(6200 6000 4000 2000 1000)
FAN2=(6200 6000 4000 2000 1000)

This means that when the temperature hits 95 degrees, it will set Fan1 and Fan2 to 6200 rpm; 84 to 6000 and so on. If you have a fan that makes noise, disable it by changing the speeds to 0. 


**2. Can I change the temperature keys fan_monitor looks at?**

**Mac OS X**

After you've found all the keys your machine has by doing "istats scan," find the ones you want to add or change by modifying the KEYS array in fan_monitor. 

**Linux**

Modify the SENSOR variable. 

**3. Dude! It doesn't work out of the box!**

**Mac/Linux**

This doesn't come in a box, Howard. Try turning your computer on.


Thanks to the mbpfan (https://github.com/linux-on-mac/mbpfan) for showing me the sys variables. I'd still be using it if it had allowed me to disable a fan....

Check out my other adventures in Mac OS X/macOS/Linux/BSD/Beer at http://beerbabesandbsd.wordpress.com
Follow me on Tumblr if you like pictures of beer: https://beerbabesandbsd.tumblr.com/
Or if you're a Twit: http://twitter.com/beerbabesandbsd 
I'm also on MyFace (but not very often): https://www.facebook.com/phil.melendez.562 
