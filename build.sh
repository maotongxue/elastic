#!/bin/bash
chmod 777 -R ./elasticsearch/esdata
chmod 777 -R ./logstash/logs
chmod 777 -R ./logstash/pipeline
echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
sysctl -w vm.max_map_count=262144
