FROM php:7.1-alpine
RUN docker-php-ext-install pdo pdo_mysql mysqli
