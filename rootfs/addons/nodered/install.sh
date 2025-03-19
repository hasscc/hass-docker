#!/bin/bash

cd /addons/nodered

# https://github.com/hassio-addons/addon-node-red/blob/main/node-red/Dockerfile

apk add --no-cache --virtual .build-dependencies \
    build-base=0.5-r3 \
    linux-headers=6.6-r1 \
    py3-pip=24.3.1-r0 \
    python3-dev=3.12.9-r0

apk add --no-cache \
    icu-data-full=74.2-r0 \
    nodejs=22.13.1-r0 \
    npm=10.9.1-r0 \
    openssh-client=9.9_p2-r0 \
    patch=2.7.6-r10

npm install \
    --no-audit \
    --no-fund \
    --no-update-notifier \
    --omit=dev \
    --unsafe-perm

npm rebuild --build-from-source @serialport/bindings-cpp
npm cache clear --force

apk del --no-cache --purge .build-dependencies
rm -fr \
    /root/.cache \
    /root/.npm \
    /root/.nrpmrc \
    /tmp/*

rm install.sh
cp -R . /etc/services.d/nodered
