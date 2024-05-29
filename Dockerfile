# Use an official PHP 8.1 image
FROM php:8.1-fpm

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

# Start PHP-FPM
RUN php-fpm81 -D

# Start Nginx
RUN nginx -g 'daemon off;'

# Run Phinx migrations
RUN php81 vendor/bin/phinx migrate -vvv

# Set the default command to run
CMD ["sh"]
