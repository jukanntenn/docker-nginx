#!/bin/sh

mkdir -p /etc/nginx/conf.d

# https://crontab.guru/every-week
echo "0 0 * * 0 root certbot renew >> /var/log/cron.log 2>&1" >/etc/cron.d/certbot
touch /var/log/cron.log

service cron start

# Hand off to the CMD
exec "$@"