#!/bin/bash

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Run as user "elasticsearch" if the command is "elasticsearch"
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
        chown -R elasticsearch:elasticsearch /usr/elasticsearch/data 
	set -- su-exec elasticsearch "$@"
        echo "sleep 1m,run sgadmin.sh"
	/sgadmin.sh &
	$@
fi

exec echo complete!
