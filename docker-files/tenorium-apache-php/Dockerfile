FROM php:7.4.3-apache

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    curl \
    libcurl4-openssl-dev \
    libxml2-dev \
    libzip-dev \
    git \
    unzip

RUN docker-php-ext-install curl xml zip mysqli pdo pdo_mysql

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#ENTRYPOINT ["/docker-entrypoint.sh"]