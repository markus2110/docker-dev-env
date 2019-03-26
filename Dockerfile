
########################################
#   PROD CONFIG                        #
########################################
FROM markus2110/php:7.2-fpm-stretch AS PRODUCTION

    # This is already done at the new php image
    # ARG PHP_SETTINGS_SRC
    # ARG PHP_SETTINGS_DEST
    # ARG PHP_CONF_DIR
    
    # ENV PHP_SETTINGS_SRC    ${PHP_SETTINGS_SRC:-php-prod-settings.ini}
    # ENV PHP_SETTINGS_DEST   ${PHP_SETTINGS_DEST:-environment.ini}
    # ENV PHP_CONF_DIR        ${PHP_CONF_DIR:-/usr/local/etc/php/conf.d}

    # COPY ./Docker/php/conf.d/${PHP_SETTINGS_SRC}    ${PHP_CONF_DIR}/${PHP_SETTINGS_DEST}
# ------------------------------------------------------------------------------------------------ #



########################################
#   QA CONFIG                          #
########################################
FROM PRODUCTION AS QA



# ------------------------------------------------------------------------------------------------ #

########################################
#   TEST CONFIG                        #
########################################
FROM QA AS TEST




# ------------------------------------------------------------------------------------------------ #
    

########################################
#   DEVELOP CONFIG                     #
########################################
FROM TEST AS DEVELOP

    ARG XDEBUG_HANDLER
    ARG XDEBUG_PORT
    ARG XDEBUG_HOST
    ENV XDEBUG_HANDLER  ${XDEBUG_HANDLER:-dbgp}
    ENV XDEBUG_PORT     ${XDEBUG_PORT:-9000}
    ENV XDEBUG_HOST     ${XDEBUG_HOST:-0.0.0.0}

    ARG MAILCATCHER_PORT
    ARG MAILCATCHER_HOST
    ENV MAILCATCHER_PORT    ${MAILCATCHER_PORT:-1025}
    ENV MAILCATCHER_HOST    ${MAILCATCHER_HOST:-mailcatcher}    

    ENV PHP_SETTINGS_SRC php.ini-development

    COPY ./Docker/php/conf.d/${PHP_SETTINGS_SRC}    ${PHP_CONF_DIR}/${PHP_SETTINGS_DEST}
    # COPY Empty xdebug file
    # COPY ./Docker/php/conf.d/xdebug.ini           ${PHP_CONF_DIR}/xdebug.ini

    # RUN apt-get install -y msmtp --no-install-recommends \
    #     # XDEBUG 
    #     && docker-php-ext-enable xdebug \
    #     && echo "; Additional xdebug settings"                  >> ${PHP_CONF_DIR}/xdebug.ini \
    #     && echo "xdebug.remote_enable=1"                        >> ${PHP_CONF_DIR}/xdebug.ini \
    #     && echo "xdebug.remote_handler=\"${XDEBUG_HANDLER}\""   >> ${PHP_CONF_DIR}/xdebug.ini \
    #     && echo "xdebug.remote_port=${XDEBUG_PORT}"             >> ${PHP_CONF_DIR}/xdebug.ini \
    #     && echo "xdebug.remote_host=\"${XDEBUG_HOST}\""         >> ${PHP_CONF_DIR}/xdebug.ini \
    #     && \
    #     # MSMTP Config to send mails to the mailcatcher service
    #     echo "account default"                                  >> /etc/msmtprc \
    #     && echo "host ${MAILCATCHER_HOST}"                      >> /etc/msmtprc \
    #     && echo "port ${MAILCATCHER_PORT}"                      >> /etc/msmtprc \
    #     && echo "from mail@dev.docker"                          >> /etc/msmtprc \
    #     # Update php settings
    #     && echo "sendmail_path = \"/usr/bin/msmtp -t\""         >> ${PHP_CONF_DIR}/${PHP_SETTINGS_DEST}
        


# ------------------------------------------------------------------------------------------------ #        


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