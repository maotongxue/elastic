FROM alpine:3.7

COPY ["./elasticsearch/searchguard/*","/"]
COPY ["./elasticsearch/run/*","/run/"]
ENV ES_TMPDIR /usr/elasticsearch/tmp

RUN apk add --no-cache openjdk8-jre wget bash su-exec curl \
    && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz \
    && tar -xf  elasticsearch-*.tar.gz -C /usr/ \
    && rm -rf /elasticsearch-*.tar.gz \
    && mv /usr/elasticsearch-* /usr/elasticsearch \
    && /usr/elasticsearch/bin/elasticsearch-plugin install -b com.floragunn:search-guard-6:6.2.4-22.1 \
    && chmod 777 /usr/elasticsearch/plugins/search-guard-6/tools/sgadmin.sh \
    && mv /sg_internal_users.yml /usr/elasticsearch/plugins/search-guard-6/sgconfig/ \
    && mv /*.jks /usr/elasticsearch/config/ \
    && mkdir /usr/elasticsearch/data \
    && mkdir /usr/elasticsearch/tmp \
    && adduser -D -u 1000 -h /usr/elasticsearch elasticsearch \
    && chown -R elasticsearch /usr/elasticsearch \
    && apk del wget \
    && rm -rf /var/cache/apk/*

ENV PATH /usr/elasticsearch/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ENTRYPOINT ["/run/docker-entrypoint.sh"]
CMD ["elasticsearch"]
