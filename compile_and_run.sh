#!/bin/sh
BASEPATH="/data"
# http://stackoverflow.com/questions/8183191/concatenating-files-and-insert-new-line-in-between-files
sed -e '$s/$/\n/' -s $BASEPATH/caddy.d/*.caddy > $BASEPATH/Caddyfile

exec /opt/caddy/caddy -agree=${AGREE_TOS} -email="${DEFAULT_EMAIL}" -conf="${BASEPATH}/Caddyfile" -log="${BASEPATH}/caddy.log"
