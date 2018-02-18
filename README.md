# Docker 镜像部署 v2ray 到 heroku

1.创建 Heroku 应用 （https://dashboard.heroku.com/apps）

1.1 可选设置 UUID 环境变量，如不设置，默认为 91cb66ba-a373-43a0-8169-33d4eeaeb857

1.2 获取注册 heroku 的 Email_Address 和 API_Key。（https://dashboard.heroku.com/account）

2.下载安装运行 Docker Community Edition。（https://store.docker.com/editions/community/docker-ce-desktop-windows）

3.部署 v2ray 服务端。

3.1 连接 registry.heroku.com。（docker login -u "Email_Address" -p "API_Key" registry.heroku.com）

3.2 从 dockerhub 拉取不同版本 v2ray 镜像。（docker pull wangyi2005/v2ray-heroku:3.9)

3.3 TAG 镜像。(docker tag wangyi2005/v2ray-heroku:3.9 registry.heroku.com/your_heroku_app/web)

3.4 PUSH 镜像到 Heroku。（docker push registry.heroku.com/your_heroku_app/web）

4.设置 v2ray 客户端

4.1 传输方式为 websocket。

4.2 设置 VMESS user UUID。

参考 https://github.com/onplus/v2hero/wiki/Deploy-V2ray-To-Heroku
