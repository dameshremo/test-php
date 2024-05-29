# Use an official PHP 8.1 image
FROM php:8.1-fpm

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Set the default command to run
CMD ["sh", "-c", "php-fpm81 -D && nginx -g 'daemon off;' && php81 vendor/bin/phinx migrate -vvv"]
