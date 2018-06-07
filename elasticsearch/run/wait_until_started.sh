#!/bin/bash
RET=1
while [[ RET -ne 0 ]]; do
    echo "Stalling for Elasticsearch..."
    curl -XGET -k -u "admin:$ADMIN_PASSWD" "http://localhost:$HTTP_PORT/" >/dev/null 2>&1
    RET=$?
    sleep 5
done
