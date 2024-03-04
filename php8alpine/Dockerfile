FROM php:8.1.21-fpm-alpine3.17

# Install Alpine packages
RUN apk --no-cache add \
    autoconf \
    icu-dev \
    g++ \
    gcc \
    git \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    oniguruma-dev \
    postgresql-dev \
    cmake \
    postgresql-libs \
    libtool \
    make

# Install PHP extensions
RUN docker-php-ext-install -j$(nproc) intl \
    # Install gd
    && ln -s /usr/lib/$(apk --print-arch)-linux-gnu/libXpm.* /usr/lib/ \
    && docker-php-ext-configure gd \
        --enable-gd \
        --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    # Install bcmath
    && docker-php-ext-install -j$(nproc) bcmath \
    # Install opcache
    && docker-php-ext-install -j$(nproc) opcache \
    # Install pdo_pgsql
    && docker-php-ext-install -j$(nproc) pdo_pgsql \
    # Install pgsql
    && docker-php-ext-install -j$(nproc) pgsql \
    # Install zip
    && docker-php-ext-configure zip --with-zip \
    && docker-php-ext-install -j$(nproc) zip

# Install imagick
RUN apk add --no-cache --virtual \
    libmagickwand-dev \
    imagemagick \
    imagemagick-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD ./config/php.ini /usr/local/etc/php/conf.d/95-default.ini
ADD ./config/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

WORKDIR "/var/www"
USER www-data
