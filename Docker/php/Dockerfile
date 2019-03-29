FROM markus2110/php:7.2-fpm-alpine-dev

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apk update && \
    apk add --no-cache \
    zlib-dev \
&& \
    docker-php-ext-install zip