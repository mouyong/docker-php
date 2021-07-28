#!/bin/sh

# 执行数据表迁移
/usr/local/bin/php /var/www/html/artisan migrate --force
# 缓存路由
/usr/local/bin/php /var/www/html/artisan route:cache
# 缓存配置
/usr/local/bin/php /var/www/html/artisan config:cache

echo "cron"
#mkdir -p /var/spool/cron/crontabs/
#cp crontab /var/spool/cron/crontabs/root
#chmod 0600 /var/spool/cron/crontabs/root
#crontab /var/spool/cron/crontabs/root
crontab crontab
cron -f &
