ARG VERSION=latest
FROM ghcr.io/home-assistant/home-assistant:${VERSION}

ARG ADDONS
ARG TARGETPLATFORM
ARG HUB_DOMAIN=github.com
ENV ALWAYS_INSTALL=true \
    ALWAYS_UPGRADE=false \
    MQTT_USERNAME=homeassistant \
    MQTT_PORT=1883 \
    NODERED_USERNAME=homeassistant \
    NODERED_PORT=1880 \
    TZ=Asia/Shanghai

COPY rootfs/ /

RUN \
  mkdir /hacs && cd /hacs && \
  touch home-assistant.log && \
  /install.sh && \
  cd /config
