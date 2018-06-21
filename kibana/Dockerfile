FROM alpine:3.7

RUN apk add --no-cache wget bash nodejs \
    && wget https://artifacts.elastic.co/downloads/kibana/kibana-oss-6.3.0-linux-x86_64.tar.gz \
    && tar zxvf kibana-*-linux-x86_64.tar.gz \
    && rm kibana-*-linux-x86_64.tar.gz \
    && mv kibana-*-linux-x86_64 /usr/kibana \
    && adduser -D -u 1000 -h /usr/kibana kibana \
    && chown -R kibana /usr/kibana \
    # usr alpine nodejs and not bundled version
    && bundled='NODE="${DIR}/node/bin/node"' \
    && apline_node='NODE="/usr/bin/node"' \
    && sed -i "s|$bundled|$apline_node|g" /usr/kibana/bin/kibana-plugin \
    && sed -i "s|$bundled|$apline_node|g" /usr/kibana/bin/kibana \
    && rm -rf /usr/kibana/node \
    && apk del wget \
    && rm -rf /var/cache/apk/*

USER kibana
WORKDIR /usr/kibana
CMD [ "./bin/kibana"]
