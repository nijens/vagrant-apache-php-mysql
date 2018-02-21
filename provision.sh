#!/usr/bin/env bash

# Add and update APT repositories
echo '' | sudo add-apt-repository ppa:ondrej/php
sudo DEBIAN_FRONTEND=noninteractive apt-get update

# Install common packages
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y imagemagick gettext subversion git

# Install Apache
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 libapache2-mpm-itk
sudo DEBIAN_FRONTEND=noninteractive a2enmod filter deflate mime expires rewrite headers
sudo service apache2 restart

# Install MySQL
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

# Install PHP 5.6, 7.0, 7.1 and 7.2
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
                                            libapache2-mod-php5.6 \
                                            php5.6 \
                                            php5.6-curl \
                                            php5.6-gd \
                                            php5.6-imap \
                                            php5.6-intl \
                                            php5.6-ldap \
                                            php5.6-mbstring \
                                            php5.6-mcrypt \
                                            php5.6-mysql \
                                            php5.6-pgsql \
                                            php5.6-tidy \
                                            php5.6-xml \
                                            php5.6-xsl \
                                            php5.6-zip \
                                            php7.0 \
                                            php7.1 \
                                            php7.2 \
                                            libapache2-mod-php7.0 \
                                            libapache2-mod-php7.1 \
                                            libapache2-mod-php7.2 \
                                            php7.*-curl \
                                            php7.*-gd \
                                            php7.*-imap \
                                            php7.*-intl \
                                            php7.*-ldap \
                                            php7.*-mbstring \
                                            php7.*-mcrypt \
                                            php7.*-mysql \
                                            php7.*-pgsql \
                                            php7.*-tidy \
                                            php7.*-xml \
                                            php7.*-xsl \
                                            php7.*-zip \
                                            php-imagick \
                                            php-mongo \
                                            php-oauth \
                                            php-pear \
                                            php-ssh2 \
                                            php-xdebug

sudo phpdismod opcache
sudo phpdismod xdebug

# Install PHP Composer package manager
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

# Generate locales (en_US, en_GB, nl_BE and nl_NL)
sudo locale-gen --purge en_US.UTF-8
sudo locale-gen en_US
sudo locale-gen en_US.ISO-8859-15
sudo locale-gen en_GB.UTF-8
sudo locale-gen en_GB
sudo locale-gen en_GB.ISO-8859-15
sudo locale-gen nl_BE
sudo locale-gen nl_BE.UTF-8
sudo locale-gen nl_BE@euro
sudo locale-gen nl_NL
sudo locale-gen nl_NL.UTF-8
sudo locale-gen nl_NL@euro

# Remove APT archives
sudo apt-get clean

# Clear Bash history and exit
cat /dev/null > ~/.bash_history && history -c && exit
