ARG VERSION=latest
FROM homeassistant/home-assistant:${VERSION}

ENV ALWAYS_INSTALL=true
ENV ALWAYS_UPGRADE=false

COPY rootfs/ /

RUN \
  chmod a+x /etc/services.d/hacs/run && \
  chmod a+x /install.sh && \
  mkdir /hacs && cd /hacs && \
  touch home-assistant.log && \
  /install.sh && \
  cd /config
