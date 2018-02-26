cd /v2raybin
curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
unzip v2ray.zip 
cd /v2raybin/v2ray-v$VER-linux-64
#mv /v2raybin/v2ray-v$VER-linux-64/v2ray /v2raybin/ \
#mv /v2raybin/v2ray-v$VER-linux-64/v2ctl /v2raybin/ \
#mv /v2raybin/v2ray-v$VER-linux-64/geoip.dat /v2raybin/ \
#mv /v2raybin/v2ray-v$VER-linux-64/geosite.dat /v2raybin/ \
#chmod +x /v2raybin/v2ray \
#rm -rf v2ray.zip \
#rm -rf v2ray-v$VER-linux-64 

echo -e -n "$CONFIG_JSON1" > config.json
echo -e -n "$PORT" >> config.json
echo -e -n "$CONFIG_JSON2" >> config.json
echo -e -n "$UUID" >> config.json
echo -e -n "$CONFIG_JSON3" >> config.json

./v2ray
