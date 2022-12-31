FROM php:7.3.4-apache

ENV GID 1000
ENV UID 1000

# Install Mcrypt
RUN apt-get update \
  && apt-get install -y libmcrypt-dev git \
  && pecl install mcrypt \
  && docker-php-ext-enable mcrypt

# Install iconv
RUN docker-php-ext-install iconv

# Install iconv
RUN docker-php-ext-install iconv

# XDebug
RUN pecl install xdebug-2.7.0
RUN docker-php-ext-enable xdebug

# Install JSON
RUN docker-php-ext-install json

# Install PDO & PDO(MySQL)
RUN docker-php-ext-install pdo
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql
RUN docker-php-ext-install -j$(nproc) pdo_mysql

# Install Mbstring
RUN docker-php-ext-configure mbstring --enable-mbstring
RUN docker-php-ext-install mbstring

# Install ZIP
RUN apt-get install -y zip libzip-dev \
  && docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-install zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer && \
  chmod +x /usr/local/bin/composer

# Install GD
RUN apt-get update \
	&& apt-get install -y \
		libfreetype6-dev \
		libpng-dev \
		libjpeg-dev \
	&& docker-php-ext-configure gd \
		--with-freetype-dir=/usr/include/ \
		--with-jpeg-dir=/usr/include/ \
		--with-png-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd


RUN addgroup --gid $GID swali && \
	adduser --uid $UID \
		--ingroup swali \
		--shell /bin/bash \
		--disabled-password \
		--gecos "" \
		--disabled-password admin

USER admin