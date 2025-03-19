# Home Assistant for China

### 预装集成
> 本镜像每日更新，[可用标签](https://github.com/hasscc/hass-docker/pkgs/container/hacn/versions?filters[version_type]=tagged)有`stable`、`latest`、`dev`及月度版本如`2024.9`
>
> 如果想要加载项功能，可以使用[hass-super](https://github.com/hasscc/hass-super)，或使用[内置扩展](#addons)镜像
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
- [小燕 · Terncy](https://github.com/rxwen/homeassistant-terncy-component) _(2024.12+)_
- [Edge TTS](https://github.com/hasscc/hass-edge-tts) _(2024.11+)_
- [AI Conversation Agent](https://github.com/hasscc/ai-conversation) _(2024.9+)_


### 可用镜像
* ghcr.nju.edu.cn/hasscc/hacn
* registry.cn-hangzhou.aliyuncs.com/hasscc/hacn
* ccr.ccs.tencentyun.com/hacn/hacn
* hacn/hacn

### 可用标签
* `stable` `latest` 最新稳定版
* `2025.1` `2024.9` 对应HA Core月度版本
* `addons` `2025.1-addons` [内置插件](#addons)版本
* `mqtt` `2025.2-mqtt` 仅内置MQTT Broker版本
* `nodered` `2025.3-nodered` 仅内置Node-RED版本
* `dev` `dev-addons` `dev-mqtt` HA Core开发版


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
  ghcr.nju.edu.cn/hasscc/hacn:stable
```

### Compose 安装
> https://www.home-assistant.io/installation/linux#docker-compose

```yaml
services:
  homeassistant:
    container_name: homeassistant
    image: ghcr.nju.edu.cn/hasscc/hacn:stable
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
    healthcheck:
      test: [CMD-SHELL, curl -I localhost:8123 || exit 1]
```


### 内置扩展
<a name="addons"></a>

> 需要2025.1及以上的镜像，标签 `addons` 包含以下所有扩展

#### MQTT Broker
- 镜像标签: `mqtt` `stable-mqtt` `dev-mqtt`
- 环境变量:
  ```yaml
  MQTT_USERNAME: homeassistant # 默认为`homeassistant`
  MQTT_PASSWORD: homeassistant # 默认为空无需授权，推荐设置
  MQTT_PORT: 1883 # 默认为`1883`
  ```

#### Node-RED
- 镜像标签: `nodered` `stable-nodered` `dev-nodered`
- 环境变量:
  ```yaml
  NODERED_USERNAME: homeassistant # 默认为`homeassistant`
  NODERED_PASSWORD: homeassistant # Node-Red后台密码
  NODERED_PORT: 1880 # 默认为`1880`
  ```
- 访问`http://IP:1880`并登录，需[手动配置HA的长效令牌](https://zachowj.github.io/node-red-contrib-home-assistant-websocket/guide/#configuration)


### 相关链接
- [DockerHub](https://hub.docker.com/r/hacn/hacn)
- [Dockerfile](https://github.com/hasscc/hass-docker/blob/main/Dockerfile)
