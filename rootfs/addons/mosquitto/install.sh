#!/bin/bash

cd /addons

apk add mosquitto mosquitto-clients
echo 'include_dir /config/mosquitto' >> /etc/mosquitto/mosquitto.conf

addgroup -S -g 1883 mosquitto 2>/dev/null
adduser -S -u 1883 -D -H -h /var/empty -s /sbin/nologin -G mosquitto -g mosquitto mosquitto 2>/dev/null

rm mosquitto/install.sh
cp -R mosquitto /etc/services.d/mosquitto
