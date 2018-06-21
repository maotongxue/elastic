FROM openjdk:8-jre

ENV ES_TMPDIR /usr/elasticsearch/tmp
ENV PATH /usr/elasticsearch/bin:$PATH

RUN apt-get update \
    && apt-get -y install wget gosu \
    && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.0.tar.gz \
    && tar -xf  elasticsearch-*.tar.gz -C /usr/ \
    && rm -rf /elasticsearch-*.tar.gz \
    && mv /usr/elasticsearch-* /usr/elasticsearch \
    && mkdir /usr/elasticsearch/data \
    && mkdir /usr/elasticsearch/tmp \
    && groupadd elasticsearch \
    && useradd -s /bin/sh -g elasticsearch elasticsearch \
    && chown -R elasticsearch /usr/elasticsearch 

COPY ./elasticsearch/docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
