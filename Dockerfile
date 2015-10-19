#
# Dockerfile for Domoticz
#
# Based on version by LBTM
#
# Base image.
FROM resin/rpi-raspbian

MAINTAINER Nanne Huiges

# Install Domoticz from sources.
RUN \
  apt-get update && \
  apt-get install -y cmake apt-utils build-essential && \
  apt-get install -y libboost-dev libboost-thread-dev libboost-system-dev libsqlite3-dev subversion curl libcurl4-openssl-dev libusb-dev zlib1g-dev

RUN \
  apt-get install -y wget

# Define working directory.
WORKDIR /root/domoticz

# Getting the source code
RUN \
  wget http://domoticz.sourceforge.net/domoticz_linux_armv7l.tgz

RUN \
  tar xvfz domoticz_linux_armv7l.tgz

# cp database (if present, otherwise gives info message)
ADD domoticz.db /root/domoticz/domoticz.db

# mountable backup dir
VOLUME /root/domoticz/backup

# Clean up APT when done.
RUN apt-get clean

# Expose port.
EXPOSE 8080

#CMD ["service domoticz start"]]
CMD ["/root/domoticz/domoticz", "-www 8080"]
