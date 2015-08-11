#!/bin/sh

sudo apt-get update

# Setup locales
sudo locale-gen UTF-8
sudo dpkg-reconfigure locales

sudo touch /var/lib/cloud/instance/locale-check.skip

# Remove 'Scotch' configuration
sudo rm /etc/php5/apache2/conf.d/user.ini

## APACHE
sudo service apache2 stop
sudo rm /etc/apache2/sites-enabled/*
sudo cp -fRv /vagrant/conf/apache2.conf /etc/apache2/apache2.conf
sudo cp -fRv /vagrant/conf/sites-available/default.conf /etc/apache2/sites-available/
sudo a2ensite default.conf
sudo service apache2 start


# APC
sudo apt-get install -y php5-apcu

# XDebug
sudo apt-get install -y php5-xdebug
echo "xdebug.remote_enable = on" | sudo tee /etc/php5/apache2/conf.d/20-xdebug.ini
echo "xdebug.remote_connect_back = on" | sudo tee /etc/php5/apache2/conf.d/20-xdebug.ini
echo "xdebug.idekey = 'vagrant' "| sudo tee /etc/php5/apache2/conf.d/20-xdebug.ini
echo "xdebug.remote_enable = on" | sudo tee /etc/php5/cli/conf.d/20-xdebug.ini
echo "xdebug.remote_connect_back = on" | sudo tee /etc/php5/cli/conf.d/20-xdebug.ini
echo "xdebug.idekey = 'vagrant' "| sudo tee /etc/php5/cli/conf.d/20-xdebug.ini



sed -i 's/expose_php = On/expose_php = Off/' /etc/php5/cli/php.ini

# Restart apache2 to get new PHP configuration
sudo service apache2 restart