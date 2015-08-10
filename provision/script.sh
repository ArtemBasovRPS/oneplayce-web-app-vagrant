#!/bin/sh

sudo service apache2 stop

# Remove all enabled VirtualHosts
sudo rm /etc/apache2/sites-enabled/*

# Copy apache config
sudo cp -fRv /vagrant/conf/apache2.conf /etc/apache2/apache2.conf

# Copy default VirtualHost
sudo cp -fRv /vagrant/conf/sites-available/default.conf /etc/apache2/sites-available/

# Enable default VirtualHost
sudo a2ensite default.conf

sudo service apache2 start
