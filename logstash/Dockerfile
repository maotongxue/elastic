FROM alpine:latest
RUN apk add --no-cache openjdk8 wget bash \
    && wget https://artifacts.elastic.co/downloads/logstash/logstash-6.2.1.tar.gz \
    && tar -xf  logstash-*.tar.gz -C /usr/ \
    && rm -rf /logstash-*.tar.gz \
    && mv /usr/logstash-* /usr/logstash \
    && adduser -D -u 1000 -h /usr/logstash logstash \
    && chown -R logstash /usr/logstash \
    && apk del wget \
    && rm -rf /var/cache/apk/*    
ENV PATH /usr/logstash/bin:$PATH

USER logstash
CMD ["/usr/logstash/bin/logstash","-f /usr/logstash/config/logstash.yml"]
