FROM markus2110/php-dev:7.2-fpm

RUN rm -rf /var/www/html/

COPY ./Application/* /var/www/html/

RUN apt-get update \
    && apt-get install -y \
        libmemcached-dev \
        zlib1g-dev \
        --no-install-recommends \
    && pecl install memcached-3.1.3 \
    && docker-php-ext-enable memcached


ENV PHP_CONF_DIR /usr/local/etc/php/conf.d