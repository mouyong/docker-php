#!/bin/sh
set -ex
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
su - www-data -s /bin/bash -c "docker-run"
cron -f &
