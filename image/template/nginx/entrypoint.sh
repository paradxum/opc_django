#!/bin/sh

sed -i "s/APP_DNS_NAME/$APP_DNS_NAME/g" /etc/nginx/conf.d/nginx.conf

exec "$@"
