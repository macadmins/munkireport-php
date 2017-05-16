FROM php:5.6-apache

RUN apt-get update \
    && apt-get install -y libldap2-dev

WORKDIR /var/www/html

RUN curl -L -o ./munkireport-php.tar.gz https://github.com/munkireport/munkireport-php/archive/v2.14.0.tar.gz
RUN tar -zxvf munkireport-php.tar.gz -C /var/www/html --strip-components=1
RUN rm munkireport-php.tar.gz

RUN mkdir -p /var/www/html/app/db && \
    touch /var/www/html/app/db/db.sqlite && \
    chmod -R 777 /var/www/html/app/db
    
COPY ./config_default.php /var/www/html/config.php

RUN a2enmod rewrite


EXPOSE 80
