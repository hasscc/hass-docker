ARG VERSION
FROM homeassistant/home-assistant:${VERSION}

ENV ALWAYS_INSTALL=false

COPY hacs /etc/services.d/hacs

RUN \
  chmod a+x /etc/services.d/hacs/run && \
  mkdir /hacs && cd /hacs && \
  touch home-assistant.log && \
  wget https://hacs.vip/get && \
  DOMAIN=hacs bash get && \
  DOMAIN=xiaomi_miot bash get && \
  DOMAIN=xiaomi_gateway3 bash get && \
  DOMAIN=tianqi bash get && \
  DOMAIN=ha_file_explorer bash get && \
  DOMAIN=ai_conversation bash get && \
  cd /config
