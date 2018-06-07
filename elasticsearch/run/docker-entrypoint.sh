#!/bin/bash

set -m

sed -i "s/-Xmx1g/-Xmx$HEAP_SIZE/g" /usr/elasticsearch/config/jvm.options
sed -i "s/-Xms1g/-Xms$HEAP_SIZE/g" /usr/elasticsearch/config/jvm.options

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Run as user "elasticsearch" if the command is "elasticsearch"
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
        chown -R elasticsearch:elasticsearch /usr/elasticsearch/data 
	set -- su-exec elasticsearch "$@" 
        $@ &
fi

/run/wait_until_started.sh
/run/users.sh
/run/sgadmin.sh

fg
