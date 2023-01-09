FROM php:8.1-apache-bullseye

WORKDIR /var/www/manage

ENV PHP_ENV=production

# Configure apt and install packages
RUN apt-get update && apt-get -y install curl zip unzip

# Install extensions
# PDO Postgres
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Install composer
RUN curl -sSL https://getcomposer.org/installer | php \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

COPY docker/scripts/entrypoint.sh /tmp/entrypoint.sh
RUN chmod -R +x /tmp/entrypoint.sh

# Apache
COPY docker/configs/apache-site.conf /etc/apache2/sites-available/000-default.conf
COPY docker/scripts/start-apache.sh /usr/local/bin/start-apache
RUN chmod -R +x /usr/local/bin/start-apache
RUN a2enmod rewrite


COPY ./composer.json ./composer.json
COPY ./composer.lock ./composer.lock
COPY ./.env ./.env
COPY ./bin ./bin
COPY ./config ./config
COPY ./src ./src
COPY ./public ./public


CMD ["/tmp/entrypoint.sh"]