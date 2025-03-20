#!/bin/bash

cd /addons/matter

# https://github.com/home-assistant-libs/python-matter-server/blob/main/Dockerfile

apk add --no-cache \
    ca-certificates \
    curl \
    libuv \
    zlib \
    jansson \
    libnl3 \
    unzip \
    gdb \
    iputils \
    iproute2 \
    gcompat

chip_example_url="https://github.com/home-assistant-libs/matter-linux-ota-provider/releases/download/2024.7.2"
[ -z "${TARGETPLATFORM}" ] && TARGETPLATFORM=$(uname -m)
echo "TARGETPLATFORM=${TARGETPLATFORM}"
case "${TARGETPLATFORM}" in
"linux/amd64" | "amd64" | "x86_64")
    curl -Lo /usr/local/bin/chip-ota-provider-app "${chip_example_url}/chip-ota-provider-app-x86-64" ;;
"linux/arm64" | "arm64" | "aarch64")
    curl -Lo /usr/local/bin/chip-ota-provider-app "${chip_example_url}/chip-ota-provider-app-aarch64" ;;
*) exit 1 ;;
esac
chmod +x /usr/local/bin/chip-ota-provider-app

pip3 install --no-cache-dir "python-matter-server[server]==7.0.1"

rm install.sh
cp -R . /etc/services.d/matter
