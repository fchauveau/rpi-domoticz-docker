#
# Dockerfile for Rpi-Domoticz
#
# Based on version by LBTM
#
# Base image.
FROM hypriot/rpi-alpine-scratch

MAINTAINER Florian Chauveau

# Install Domoticz from sources.
COPY glibc-2.21-r2.apk /glibc-2.21-r2.apk
RUN \
#  apddt-get update && \
#  apt-get install -y cmake apt-utils build-essential && \
#  apt-get install -y libboost-dev libboost-thread-dev libboost-system-dev libsqlite3-dev subversion curl libcurl4-openssl-dev libusb-dev zlib1g-dev && \
  apk add --allow-untrusted /glibc-2.21-r2.apk && rm -rf /glibc-2.21-r2.apk && \
  wget -O /root/domoticz_linux_armv7l.tgz http://domoticz.sourceforge.net/domoticz_linux_armv7l.tgz && \
  mkdir /root/domoticz && \
  tar xvfz /root/domoticz_linux_armv7l.tgz -C /root/domoticz && \
  rm -rf /tmp/* /var/tmp/* /root/domoticz_linux_armv7l.tgz

# Expose port.
EXPOSE 8080

CMD ["/root/domoticz/domoticz", "-www", "8080"]
