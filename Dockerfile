FROM php:8.2-cli

# Instala o Composer
RUN apt-get update && apt-get install -y curl unzip openssl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instala as dependências para a extensão GD e configura o PHP
RUN apt-get update && apt-get install -y \
     libpng-dev \
     libjpeg-dev \
     libfreetype6-dev \
     && docker-php-ext-configure gd --with-freetype --with-jpeg \
     && docker-php-ext-install gd

# Define o diretório de trabalho
WORKDIR /var/www/html

# Expor a porta usada pelo Laravel
EXPOSE 8000
