#!/bin/sh
set -ex

case $PLATFORM in \
"serverless") \
  echo "run in $PLATFORM" \
	mv /etc/supervisor/conf.d/queue.conf queue.conf.back && \
	mv /var/www/html/crontab crontab.back\
;; \
"vpc") \
    echo "run in $PLATFORM" \
;; \
"*") \
  echo "unknown platform $PLATFORM" \
;;
esac

cron
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
su - www-data -s /bin/bash -c "docker-run"
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi
exec "$@"
