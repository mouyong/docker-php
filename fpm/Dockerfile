FROM registry.cn-shenzhen.aliyuncs.com/mouyong-base/php8.0-composer:1.0.0 as composer

COPY database/ /app/database/
COPY packages/ /app/packages/

COPY composer.json composer.lock /app/

RUN cd /app \
      && composer install \
          --optimize-autoloader \
          --ignore-platform-reqs \
          --prefer-dist \
          --no-interaction \
          --no-plugins \
          --no-scripts \
          --no-suggest \
          --no-dev

FROM registry.cn-shenzhen.aliyuncs.com/mouyong-base/php8.0-fpm:1.0.0

COPY . /var/www/html

COPY --from=composer /app/vendor/ /var/www/html/vendor/

COPY ./deploy/docker/supervisord-queue.conf /etc/supervisor/conf.d/queue.conf

COPY ./deploy/docker/cron-run.sh /usr/local/bin/cron-run
COPY ./deploy/docker/fpm/docker-run-fpm.sh /usr/local/bin/docker-run

RUN chown -R www-data:www-data /var/www && \
  chmod 0777 -R /var/www/html/bootstrap/cache /var/www/html/storage && \
  chmod +x /usr/local/bin/docker-run /usr/local/bin/cron-run /usr/local/bin/docker-php-entrypoint
