### 预装集成
> 本镜像每日更新，可用tag有`stable`、`latest`、`dev`及月度版本如`2024.9`
>
> HA启动时会逐个检测是否安装以下集成，如果没有则自动安装，已安装不会覆盖

- [HACS极速版](https://hacs.vip)
- [小米 · Xiaomi Miot](https://github.com/al-one/hass-xiaomi-miot)
- [小米 · Xiaomi Home](https://github.com/XiaoMi/ha_xiaomi_home) _(2024.11+)_
- [小米 · XiaomiGateway3](https://github.com/AlexxIT/XiaomiGateway3)
- [易微联 · Sonoff Lan](https://github.com/AlexxIT/SonoffLAN) _(2024.11+)_
- [天气预报](https://github.com/hasscc/tianqi)
- [文件管理](https://github.com/shaonianzhentan/ha_file_explorer)
- [美的 · Midea AC Lan](https://github.com/georgezhao2010/midea_ac_lan) _(2024.11+)_
- [美的 · Midea AC Py](https://github.com/mill1000/midea-ac-py) _(2024.11+)_
- [海尔 · Haier](https://github.com/banto6/haier) _(2024.12+)_
- [巴法 · Bemfa](https://github.com/larry-wong/bemfa) _(2024.11+)_
- [Edge TTS](https://github.com/hasscc/hass-edge-tts) _(2024.11+)_
- [AI Conversation Agent](https://github.com/hasscc/ai-conversation) _(2024.9+)_


### 命令安装
> https://www.home-assistant.io/installation/linux#install-home-assistant-container

```bash
docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -v /PATH_TO_YOUR_CONFIG:/config \
  -v /run/dbus:/run/dbus:ro \
  -e TZ=Asia/Shanghai \
  -e ALWAYS_INSTALL=true \
  --network=host \
  hacn/hacn:stable
```

### Compose 安装
> https://www.home-assistant.io/installation/linux#docker-compose

```yaml
services:
  homeassistant:
    container_name: homeassistant
    image: hacn/hacn:stable
    volumes:
      - /PATH_TO_YOUR_CONFIG:/config
      - /etc/localtime:/etc/localtime:ro
      - /run/dbus:/run/dbus:ro
    environment:
      - TZ=Asia/Shanghai
      - ALWAYS_INSTALL=true  # 默认为true，每次启动都会逐个预装，否则仅全新HA才会预装
      - ALWAYS_UPGRADE=false # 默认为false，每次启动都会逐个预装最新版本的插件
    restart: unless-stopped
    privileged: true
    network_mode: host
```

### 相关链接
- [DockerHub](https://hub.docker.com/r/hacn/hacn)
- [Dockerfile](https://github.com/hasscc/hass-docker/blob/main/Dockerfile)
