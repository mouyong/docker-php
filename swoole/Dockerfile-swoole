FROM registry.cn-shenzhen.aliyuncs.com/mouyong-base/php7.4-composer:1.0.0 as composer

COPY database/ /app/database/

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

FROM registry.cn-shenzhen.aliyuncs.com/mouyong-base/php7.4-swoole:2.2.0

COPY . /var/www/html

COPY --from=composer /app/vendor/ /var/www/html/vendor/

COPY ./deploy/docker/supervisord-queue.conf /etc/supervisor/conf.d/api-queue.conf

COPY ./deploy/docker/swoole/docker-run-swoole.sh /usr/local/bin/docker-run

RUN chown -R www-data:www-data /var/www && \
 chmod 0777 -R /var/www/html/bootstrap/cache /var/www/html/storage && \
 chmod +x /usr/local/bin/docker-run /usr/local/bin/docker-php-entrypoint
