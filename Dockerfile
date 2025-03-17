ARG VERSION=latest
FROM homeassistant/home-assistant:${VERSION}

ENV ALWAYS_INSTALL=true \
    ALWAYS_UPGRADE=false \
    TZ=Asia/Shanghai

COPY rootfs/ /

RUN \
  mkdir /hacs && cd /hacs && \
  touch home-assistant.log && \
  /install.sh && \
  cd /config
