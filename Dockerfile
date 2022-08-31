FROM php:8.1-cli-alpine

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apk add --no-cache bash mysql-dev \
    && wget https://get.symfony.com/cli/installer -O - | bash \
    && docker-php-ext-install pdo pdo_mysql \
    && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

WORKDIR /api
