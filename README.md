domoticz-docker
===============

[![](https://badge.imagelayers.io/agileek/rpi-domoticz-docker:2.3530.svg)](https://imagelayers.io/?images=agileek/rpi-domoticz-docker:2.3530 'Get your own badge on imagelayers.io')

Dockerfile for domoticz on raspberry pi.
Starts a container that can be 'seeded' with an available (backup) database, if one is in the context directory.
Opens a volume for the backups directory, so you can easily retrieve any database backups.

Requirements
===
 * Docker: http://blog.hypriot.com/getting-started-with-docker-on-your-arm-device/

Getting your files
===
 * Docker file from github : git clone https://github.com/fchauveau/domoticz-docker.git
 * [optional] add your database to this directory. it is called domoticz.db

Building
===
 * cd rpi-domoticz-docker
 * sudo docker build -t my_domoticz .

Running
===
The basic command is this:

    docker run --device=/dev/ttyUSB0 -v /etc/localtime:/etc/localtime -v /SOMEPATH/domoticz.db:/root/domoticz/domoticz.db:rw -p 8080:8080 --name domoticz --restart=always -d my_domoticz


Explanations

* `docker run -d my_domoticz` : the basic run command
* `-v /etc/localtime:/etc/localtime` : use time of the host 
* `--device=/dev/ttyUSB0` means we expose a device we need to the container.
 * the old way to do this was to use --privileged, but this is a better option
 * when using --privileged, use something like: sudo docker run `---privileged -v /dev/bus/usb:/dev/bus/usb`
 * as you see you might need to play with the device name. ttyUSB0, /dev/bus/usb, /dev/bus/usb/00x/00y .. try using lsusb to find out your device
* `-v /SOMEPATH/domoticz.db:/root/domoticz/domoticz.db` mounts the 'backups' file to the created volume.
* `-p 8080:8080` means that we expose the 8080 port to local 8084
 * domoticz (and our docker install) run on port 8080, but if you have anything running on your machine, this could be an issue


Browsing
===
 * You can now access your install on http://server_ip:8080
