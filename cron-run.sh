#!/bin/bash
set -ex
if [ -f /var/www/html/crontab ]; then
  crontab /var/www/html/crontab
fi;
cron -f &