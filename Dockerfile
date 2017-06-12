FROM php:7-apache

RUN apt-get update \
    && apt-get install -y libldap2-dev libcurl4-openssl-dev libxml2-dev\
    && docker-php-ext-install -j$(nproc) curl pdo_mysql soap

RUN mkdir /var/www/munkireport

WORKDIR /var/www/munkireport

RUN curl -L -o ./munkireport-php.tar.gz https://github.com/munkireport/munkireport-php/archive/v2.14.0.tar.gz
RUN tar -zxvf munkireport-php.tar.gz --strip-components=1
RUN rm munkireport-php.tar.gz

RUN mkdir -p app/db && \
    touch app/db/db.sqlite && \
    chmod -R 777 app/db

RUN ln -s /var/www/munkireport/index.php /var/www/html && \
    ln -s /var/www/munkireport/assets /var/www/html && \
    ln -s /var/www/munkireport/.htaccess /var/www/html
    
COPY ./config_default.php /var/www/munkireport/config.php

RUN a2enmod rewrite


EXPOSE 80
