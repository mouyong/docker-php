#!/bin/bash
set -ex
if [ -f /var/www/html/crontab ]; then
  crontab -u www-data /var/www/html/crontab
fi;
cron -f &