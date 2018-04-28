FROM alpine

RUN apk add --no-cache nodejs wget bash \
    && wget https://artifacts.elastic.co/downloads/kibana/kibana-6.2.1-linux-x86_64.tar.gz \
    && tar zxvf kibana-6.2.1-linux-x86_64.tar.gz \
    && rm kibana-6.2.1-linux-x86_64.tar.gz \
    && mv kibana-6.2.1-linux-x86_64 /usr/kibana \
    && apk del wget \
    && rm -rf /var/cache/apk/*

# run xdbana
WORKDIR /usr/kibana
CMD [ "./bin/kibana"]
