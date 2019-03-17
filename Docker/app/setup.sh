#!/bin/bash

echo "; Additional xdebug settings" >> $PHP_CONF_DIR/xdebug.ini \
    && echo xdebug.remote_handler=1                           >> $PHP_CONF_DIR/xdebug.ini \
    && echo xdebug.remote_handler=$XDEBUG_REMOTE_HANDLER    >> $PHP_CONF_DIR/xdebug.ini \
    && echo xdebug.remote_port=$XDEBUG_REMOTE_PORT          >> $PHP_CONF_DIR/xdebug.ini \
    && echo xdebug.remote_host=$XDEBUG_REMOTE_HOST          >> $PHP_CONF_DIR/xdebug.ini

cat $PHP_CONF_DIR/xdebug.ini