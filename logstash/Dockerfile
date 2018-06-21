FROM alpine:3.7

RUN apk add --no-cache openjdk8 wget bash \
    && wget https://artifacts.elastic.co/downloads/logstash/logstash-oss-6.3.0.tar.gz \
    && tar -xf  logstash-*.tar.gz -C /usr/ \
    && rm -rf /logstash-*.tar.gz \
    && mv /usr/logstash-* /usr/logstash \
    && adduser -D -u 1000 -h /usr/logstash logstash \
    && chown -R logstash /usr/logstash \
    && apk del wget \
    && rm -rf /var/cache/apk/*    

USER logstash
WORKDIR /usr/logstash
CMD ["./bin/logstash"]
