#!/usr/bin/env bash

VERSION=$1

if [ -z $VERSION ]
then
    echo ""
    echo "  Usage: $0 <version>"
    echo ""
    exit 1
fi

# Add and update APT repositories
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/$VERSION.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-$VERSION.x.list
sudo apt-get update

# Install Java 8 runtime
sudo apt-get install -y openjdk-8-jre

# Install Elasticsearch
sudo apt-get -y install elasticsearch

# Configure Elasticsearch
sudo curl https://raw.githubusercontent.com/nijens/vagrant-apache-php-mysql/master/provision/elasticsearch.yml > /etc/elasticsearch.yml

# Start Elasticsearch server
sudo service elasticsearch start
