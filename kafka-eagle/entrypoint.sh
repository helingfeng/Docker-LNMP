#!/usr/bin/env bash
prefix="jdbc:sqlite:"
if [[ "$EFAK_DB_URL" == *"$prefix"* ]]; then
  db_dir=$(echo ${EFAK_DB_URL#${prefix}} | sed -e "s/\/[^\/]*$//")
  mkdir -p $db_dir
fi
envsubst < "/tmp/system-config.properties" > "/opt/efak/conf/system-config.properties"
/opt/efak/bin/ke.sh start
tail -f /opt/efak/kms/logs/catalina.out