#!/bin/sh
set -ex
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
docker-run

if [ -f /var/www/html/crontab ]; then
  crontab /var/www/html/crontab
fi

[ -f /var/www/html/crontab ]

echo $?
