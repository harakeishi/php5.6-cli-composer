FROM php:5.6.21-cli
RUN apt-get update && apt-get install -y libmemcached-dev libxml2-dev libicu-dev zlib1g-dev zip \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install soap \
    && docker-php-ext-install intl
RUN apt install -y mysql-client

RUN apt update && apt install -y git sudo wget gnupg
COPY --from=composer:1.10.10 /usr/bin/composer /usr/bin/composer
