#!/bin/bash
chmod 777 /usr/elasticsearch/plugins/search-guard-6/tools/hash.sh

hash=$(/usr/elasticsearch/plugins/search-guard-6/tools/hash.sh -p $ADMIN_PASSWD)
cat << EOF > /usr/elasticsearch/plugins/search-guard-6/sgconfig/sg_internal_users.yml
admin:
  hash: '$hash'
  roles:
    - admin
EOF

#sed -ri "s/hash:[^\r\n#]*#elastic/hash: \'$hash\' #elastic/" /usr/elasticsearch/plugins/search-guard-6/sgconfig/sg_internal_users.yml

cat /usr/elasticsearch/plugins/search-guard-6/sgconfig/sg_internal_users.yml
