FROM php:8.3-cli-alpine
RUN apk add --no-cache git unzip libzip-dev \
	&& docker-php-ext-install zip
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
WORKDIR /app
CMD ["sh", "-ec", "if [ ! -f artisan ]; then composer create-project laravel/laravel . --no-interaction; if [ -f routes_template.php ]; then cp routes_template.php routes/web.php; fi; fi; php artisan serve --host=0.0.0.0 --port=8000"]
