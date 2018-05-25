FROM alpine:3.7

RUN apk add --no-cache openjdk8 wget bash \
    && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.1.tar.gz \
    && tar -xf  elasticsearch-*.tar.gz -C /usr/ \
    && rm -rf /elasticsearch-*.tar.gz \
    && mv /usr/elasticsearch-* /usr/elasticsearch \
    && mkdir /usr/elasticsearch/data \
    && adduser -D -u 1000 -h /usr/elasticsearch elasticsearch \
    && chown -R elasticsearch /usr/elasticsearch \
    && apk del wget \
    && rm -rf /var/cache/apk/*

USER elasticsearch
WORKDIR /usr/elasticsearch
CMD ["./bin/elasticsearch"]

