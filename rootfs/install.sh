#!/bin/bash

function info () { echo -e "\033[0;32m$1\033[0m"; }

wget https://hacs.vip/get

[ ! -d /config/custom_components/hacs ] && DOMAIN=hacs bash get && info "Installed hacs"
[ ! -d /config/custom_components/xiaomi_miot ] && DOMAIN=xiaomi_miot bash get && info "Installed xiaomi_miot"
[ ! -d /config/custom_components/xiaomi_home ] && DOMAIN=xiaomi_home bash get && info "Installed xiaomi_home"
[ ! -d /config/custom_components/xiaomi_gateway3 ] && DOMAIN=xiaomi_gateway3 bash get && info "Installed xiaomi_gateway3"
[ ! -d /config/custom_components/sonoff ] && DOMAIN=sonoff bash get && info "Installed sonoff"
[ ! -d /config/custom_components/tianqi ] && DOMAIN=tianqi bash get && info "Installed tianqi"
[ ! -d /config/custom_components/edge_tts ] && DOMAIN=edge_tts bash get && info "Installed edge_tts"
[ ! -d /config/custom_components/ha_file_explorer ] && DOMAIN=ha_file_explorer bash get && info "Installed ha_file_explorer"
[ ! -d /config/custom_components/ai_conversation ] && DOMAIN=ai_conversation bash get && info "Installed ai_conversation"
[ ! -d /config/custom_components/bemfa ] && DOMAIN=bemfa bash get && info "Installed bemfa"
[ ! -d /config/custom_components/haier ] && DOMAIN=haier bash get && info "Installed haier"
[ ! -d /config/custom_components/midea_ac_lan ] && DOMAIN=midea_ac_lan bash get && info "Installed midea_ac_lan"
[ ! -d /config/custom_components/midea_ac ] && DOMAIN=midea_ac bash get && info "Installed midea_ac"
[ ! -d /config/custom_components/terncy ] && DOMAIN=terncy bash get && info "Installed terncy"

rm -rf ./get

if [ -n "${ADDONS:-}" ]; then
  apk update 2>/dev/null
fi

if [[ "${ADDONS:-}" == *"addons"* ]] || [[ "${ADDONS:-}" == *"mqtt"* ]]; then
  echo "Installing mosquitto"
  /addons/mosquitto/install.sh
fi

if [[ "${ADDONS:-}" == *"addons"* ]] || [[ "${ADDONS:-}" == *"nodered"* ]]; then
  echo "Installing node-red"
  /addons/nodered/install.sh
fi

if [[ "${ADDONS:-}" == *"addons"* ]] || [[ "${ADDONS:-}" == *"matter"* ]]; then
  echo "Installing matter-server"
  /addons/matter/install.sh >> /build.log 2>&1
fi

rm -rf /var/cache/apk/*
rm -rf /addons