# 一键部署 v2ray 到 heroku  [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

1.部署时选择 v2ray core 的版本和Vmess协议的UUID（"alterId"默认为64）。

2.服务端部署后，应 open app ，显示 Bad Request，表示部署成功。

  如更新 v2ray 版本，修改 app settings-->Config Vars-->VER，程序自动重启，通过view Logs确认。

3.客户端配置 client_config.json, 建议使用 websocket+tls+herokuapp IP 传输协议。

  nslookup  us-east-1-a.route.herokuapp.com 8.8.8.8


# 参考 
https://github.com/v2ray/v2ray-core

https://github.com/onplus/v2hero/
