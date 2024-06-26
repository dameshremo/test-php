# Use an official PHP 8.1 image
FROM php:8.1-fpm

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Set the default command to run
CMD ["php", "-S", "0.0.0.0:8000", "-t", "/app"]
