FROM markus2110/php:7.2-fpm-alpine-dev

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


RUN apk update && apk add --no-cache --virtual build-dependencies \
    # Install build dependencies 
        zlib-dev \
    # 
    && docker-php-ext-install zip \
    # Cleanup
    && rm -rf /var/cache/apk/* \
    && apk del build-dependencies


    
RUN echo "sendmail_path = /usr/sbin/sendmail -S mailcatcher:1025"         >> ${PHP_CONF_DIR}/mailcatcher.ini