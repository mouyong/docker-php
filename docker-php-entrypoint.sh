#!/bin/sh
set -ex
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
docker-run
cron-run
