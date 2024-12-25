#!/bin/sh

. /tmp/env
# remove default file
rm -f /etc/nginx/conf.d/default.conf

#change listen
: "${PORT:=11002}"

if [[ $LISTEN ]]
then
  SEPARATE=':'
else
  SEPARATE=''
fi

sed -i "s/.*listen.*/    listen ${LISTEN}${SEPARATE}${PORT};/" /etc/nginx/conf.d/main.conf
