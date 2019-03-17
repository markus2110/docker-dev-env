FROM markus2110/php-dev:7.2-fpm



ENV PHP_CONF_DIR /usr/local/etc/php/conf.d

ENV XDEBUG_REMOTE_HANDLER dbgp
ENV XDEBUG_REMOTE_PORT 9000
ENV XDEBUG_REMOTE_HOST=0.0.0.0


COPY ./conf.d/* ${PHP_CONF_DIR}/

RUN echo "; Additional xdebug settings"                         >> ${PHP_CONF_DIR}/xdebug.ini \
    && echo "xdebug.remote_handler=1"                           >> ${PHP_CONF_DIR}/xdebug.ini \
    && echo "xdebug.remote_handler=\"$XDEBUG_REMOTE_HANDLER\""  >> ${PHP_CONF_DIR}/xdebug.ini \
    && echo "xdebug.remote_port=$XDEBUG_REMOTE_PORT"            >> ${PHP_CONF_DIR}/xdebug.ini \
    && echo "xdebug.remote_host=\"$XDEBUG_REMOTE_HOST\""        >> ${PHP_CONF_DIR}/xdebug.ini
