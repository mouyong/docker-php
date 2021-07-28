#!/bin/sh
set -ex
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
cron -f &
if [ -f /var/www/html/crontab ]; then
  crontab /var/www/html/crontab
fi;
docker-run
