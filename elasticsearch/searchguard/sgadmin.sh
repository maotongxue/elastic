#!/bin/bash

sleep 1m

cd /usr/elasticsearch/plugins/search-guard-6/tools/

./sgadmin.sh \
-cd ../sgconfig \
-ks /usr/elasticsearch/config/node-0-keystore.jks \
-ts /usr/elasticsearch/config/truststore.jks \
-icl \
-kspass maotongxue \
-tspass maotongxue \
-nhnv \
-p $HOST_PORT 

exit
