FROM markus2110/php-dev:7.2-fpm

# Already done in markus2110/php-dev:7.2-fpm

#WORKDIR /var/www/html
# Composer
#COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


# RUN apt-get update \
#     && apt-get install -y wget libmagickwand-dev --no-install-recommends \
#     && pecl install imagick xdebug \
#     && docker-php-ext-install mbstring mysqli pdo pdo_mysql opcache intl \
#    && docker-php-ext-enable imagick xdebug

# RUN apt-get clean autoclean \
# 	&& apt-get autoremove --yes \
#     && rm -rf /var/lib/{apt,dpkg,cache,log}/

#    Node JS
#    && apt-get install -y gnupg --no-install-recommends \
#    && cd ~ \
#    && curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh \
#    && chmod +x nodesource_setup.sh \
#    && ~/nodesource_setup.sh \
#    && apt-get install nodejs -y \
    # Clear APT list
    # && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev msmtp --no-install-recommends \
    && pecl install memcached-3.1.3 \
    && docker-php-ext-enable memcached


ENV PHP_CONF_DIR /usr/local/etc/php/conf.d

ENV XDEBUG_REMOTE_HANDLER dbgp
ENV XDEBUG_REMOTE_PORT 9000
ENV XDEBUG_REMOTE_HOST 0.0.0.0

COPY ./conf.d/* ${PHP_CONF_DIR}/
COPY ./msmtprc /etc/msmtprc

RUN echo "; Additional xdebug settings"                         >> ${PHP_CONF_DIR}/xdebug.ini \
    && echo "xdebug.remote_handler=1"                           >> ${PHP_CONF_DIR}/xdebug.ini \
    && echo "xdebug.remote_handler=\"$XDEBUG_REMOTE_HANDLER\""  >> ${PHP_CONF_DIR}/xdebug.ini \
    && echo "xdebug.remote_port=$XDEBUG_REMOTE_PORT"            >> ${PHP_CONF_DIR}/xdebug.ini \
    && echo "xdebug.remote_host=\"$XDEBUG_REMOTE_HOST\""        >> ${PHP_CONF_DIR}/xdebug.ini
