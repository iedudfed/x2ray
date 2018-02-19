FROM heroku/heroku:16-build as build

COPY . /app
WORKDIR /app

RUN mkdir -p /tmp/buildpack/heroku/go /tmp/build_cache /tmp/env
RUN curl https://codon-buildpacks.s3.amazonaws.com/buildpacks/heroku/go.tgz | tar xz -C /tmp/buildpack/heroku/go

RUN STACK=heroku-16 /tmp/buildpack/heroku/go/bin/compile /app /tmp/build_cache /tmp/env

FROM heroku/heroku:16

COPY --from=build /app /app
ENV HOME /app
WORKDIR /app
RUN useradd -m heroku
USER heroku

ENV VER=3.9
ENV CONFIG_JSON1={\"log\":{\"access\":\"\",\"error\":\"\",\"loglevel\":\"warning\"},\"inbound\":{\"protocol\":\"vmess\",\"port\": 
ENV PORT=8080
ENV CONFIG_JSON2=,\"settings\":{\"clients\":[{\"id\":\"
ENV UUID=91cb66ba-a373-43a0-8169-33d4eeaeb857 
ENV CONFIG_JSON3=\",\"alterId\":64}]},\"streamSettings\":{\"network\":\"ws\"}},\"inboundDetour\":[],\"outbound\":{\"protocol\":\"freedom\",\"settings\":{}}} 

RUN curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
 && unzip v2ray.zip \
 && mv /app/v2ray-v$VER-linux-64/v2ray /app/ \
 && mv /app/v2ray-v$VER-linux-64/v2ctl /app/ \
 && mv /app/v2ray-v$VER-linux-64/geoip.dat /app/ \
 && mv /app/v2ray-v$VER-linux-64/geosite.dat /app/ \
 && chmod +x /app/v2ray \
 && rm -rf v2ray.zip \
 && rm -rf v2ray-v$VER-linux-64 
 
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

CMD /entrypoint.sh
