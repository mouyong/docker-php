#!/bin/sh
set -ex
cron
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
su - www-data -s /bin/bash -c "docker-run"
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi
exec "$@"
