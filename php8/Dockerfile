FROM php:8.2-fpm

RUN apt-get -y update \
    && apt-get install -y \
    libssl-dev \
    pkg-config \
    libzip-dev \
    unzip \
    libxml2-dev \
    libicu-dev \
    zlib1g-dev \
    git

# Install Mcrypt
RUN apt-get update \
    && apt-get install -y libmcrypt-dev \
    && pecl install mcrypt \
    && docker-php-ext-enable mcrypt

# # # Install Mbstring
# RUN docker-php-ext-configure mbstring --enable-mbstring \
#   && docker-php-ext-install mbstring

# Install CURL
RUN apt-get update && apt-get install -y curl

# Install DOM
RUN docker-php-ext-install dom

# Install Fileinfo
RUN docker-php-ext-install fileinfo

RUN apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev

# RUN docker-php-ext-install mbstring
RUN docker-php-ext-install -j$(nproc) gd
# 		libjpeg-dev \
# 	&& docker-php-ext-configure gd \
# 		--with-freetype-dir=/usr/include/ \
# 		--with-jpeg-dir=/usr/include/ \
# 		--with-png-dir=/usr/include/ \
# 	&& docker-php-ext-install -j$(nproc) \
# 		gd \
# 	&& apt-get purge -y \
# 		libfreetype6-dev \
# 		libpng-dev \
# 		libjpeg-dev


# Install iconv
RUN docker-php-ext-install iconv

# Install Intl
RUN docker-php-ext-configure intl \
  && docker-php-ext-install intl

# # Install Mbstring
# RUN docker-php-ext-configure mbstring --enable-mbstring
# RUN docker-php-ext-install mbstring

# Install ZIP
RUN docker-php-ext-install zip

# Install PDO & PDO(MySQL)
RUN docker-php-ext-install pdo
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql
RUN docker-php-ext-install -j$(nproc) pdo_mysql

# Install SimpleXML
RUN docker-php-ext-install simplexml

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
        && mv composer.phar /usr/local/bin/ \
        && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Bcmath
RUN docker-php-ext-configure bcmath --enable-bcmath
RUN docker-php-ext-install bcmath

# Install Soap
RUN docker-php-ext-configure soap --enable-soap
RUN docker-php-ext-install soap

# # instal gettext & tokenizer
# RUN docker-php-ext-install gettext
# RUN docker-php-ext-install tokenizer

# Install Opcache
RUN docker-php-ext-install opcache
RUN docker-php-ext-enable opcache

# Copy opcache configration
COPY ./docker/php/php.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# #Intall imagick for manipulate images
# RUN apt-get update \
#     && apt-get install -y libmagickwand-dev imagemagick libtidy-dev \
#     && pecl install imagick-3.4.3RC2 \
#     && docker-php-ext-enable imagick \
#     && docker-php-ext-install tidy \
#     && docker-php-ext-enable tidy

# XDebug
RUN pecl install xdebug-3.2.1
RUN docker-php-ext-enable xdebug

# # Xmlrpc
# RUN docker-php-ext-install xmlrpc
# RUN docker-php-ext-install xmlwriter 

# COPY ./docker/apache/default.conf /etc/apache2/sites-enabled/000-default.conf

# RUN update-ca-certificates

# Clean up
RUN apt-get remove -y git && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Apache configuration
# RUN a2enmod rewrite
# RUN chown -R www-data:www-data /var/www/html/
RUN usermod -u 1000 www-data
