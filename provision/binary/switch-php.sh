#!/usr/bin/env bash

VERSION=$1

if [ -z $VERSION ]
then
    echo ""
    echo "  Usage: $0 <version>"
    echo ""
    exit 1
fi

BINARY=`which php$VERSION`
APACHE_MODULE=`cd /etc/apache2/mods-enabled/; ls php*.load`

# Change PHP version on CLI
sudo update-alternatives --set php $BINARY > /dev/null

# Change PHP (module) version on Apache
for ACTIVE_APACHE_MODULE in $APACHE_MODULE
do
    sudo a2dismod $ACTIVE_APACHE_MODULE > /dev/null
done

sudo a2enmod php$VERSION > /dev/null
sudo service apache2 restart

echo "Switched PHP to version $VERSION"
