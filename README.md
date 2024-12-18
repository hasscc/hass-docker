### 预装集成
> 本镜像每日更新，可用tag有`stable`、`latest`、`dev`及月度版本如`2024.9`
>
> HA启动时会逐个检测是否安装以下集成，如果没有则自动安装，已安装不会覆盖

- [HACS极速版](https://hacs.vip)
- [Xiaomi Miot](https://github.com/al-one/hass-xiaomi-miot)
- [Xiaomi Home](https://github.com/XiaoMi/ha_xiaomi_home) _(2024.11+)_
- [XiaomiGateway3](https://github.com/AlexxIT/XiaomiGateway3)
- [天气预报](https://github.com/hasscc/tianqi)
- [文件管理](https://github.com/shaonianzhentan/ha_file_explorer)
- [AI Conversation Agent](https://github.com/hasscc/ai-conversation) _(2024.9+)_


### 命令安装
> https://www.home-assistant.io/installation/linux#install-home-assistant-container

```bash
docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=Asia/Shanghai \
  -v /PATH_TO_YOUR_CONFIG:/config \
  -v /run/dbus:/run/dbus:ro \
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
      - ALWAYS_INSTALL=true # 默认为true，每次启动都会逐个预装，否则仅全新HA才会预装
    restart: unless-stopped
    privileged: true
    network_mode: host
```

### 相关链接
- [DockerHub](https://hub.docker.com/r/hacn/hacn)
- [Dockerfile](https://github.com/hasscc/hass-docker/blob/main/Dockerfile)
