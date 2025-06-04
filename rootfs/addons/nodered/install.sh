#!/bin/bash

set -eux;

cd /addons/nodered

# https://github.com/hassio-addons/addon-node-red/blob/main/node-red/Dockerfile

apk add --no-cache --virtual .build-dependencies \
    build-base \
    linux-headers \
    py3-pip \
    python3-dev

apk add --no-cache \
    icu-data-full \
    openssh-client \
    nodejs \
    npm \
    patch

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
