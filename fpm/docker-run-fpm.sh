#!/bin/sh

# 执行数据表迁移
/usr/local/bin/php /var/www/html/artisan migrate --force
# 缓存路由
/usr/local/bin/php /var/www/html/artisan route:cache
# 缓存配置
/usr/local/bin/php /var/www/html/artisan config:cache
# 定时任务
cron-run