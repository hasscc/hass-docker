ARG VERSION
FROM homeassistant/home-assistant:${VERSION}

RUN \
  mkdir /hacs && cd /hacs && \
  touch home-assistant.log && \
  wget https://hacs.vip/get && \
  DOMAIN=hacs bash get && \
  DOMAIN=miot bash get && \
  DOMAIN=tianqi bash get && \
  DOMAIN=xiaomi_gateway3 bash get && \
  DOMAIN=ha_file_explorer bash get && \
  cd /etc/services.d && \
  mkdir -p hacs && \
  touch hacs/run && \
  chmod a+x hacs/run && \
  cd /config

RUN cat <<EOF > /etc/services.d/hacs/run
#!/usr/bin/env bashio
[ -d /config/custom_components ] || cp -rf /hacs/custom_components /config/
bashio::log.info "Copied custom_components to config"
sleep infinity
EOF
