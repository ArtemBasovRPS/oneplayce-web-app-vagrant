#!/bin/sh

sudo service apache2 stop

# Remove all enabled VirtualHosts
sudo rm /etc/apache2/sites-enabled/*

# Copy apache config
sudo cp -fRv /vagrant/conf/apache2.conf /etc/apache2/apache2.conf

# Copy required VirtualHost files
sudo cp -fRv /vagrant/conf/sites-available/*.conf /etc/apache2/sites-available/

# Enable reqires VirtualHosts
sudo a2ensite default.conf

sudo service apache2 start

# Setup OnePlayce
## Composer
# sudo composer config -g github-oauth.github.com 04027f4c258ffc4c37266bc853508674ee30f5d0
# sudo composer global require "fxp/composer-asset-plugin:1.0.1"
# sudo composer install --prefer-dist --no-interaction --working-dir /var/sites/oneplayce
# ## Database
# cat /vagrant/database/OnePlayce.sql | mysql -uroot -proot
# sudo cp -n /var/sites/oneplayce/config/db-local-sample.php /var/sites/oneplayce/config/db-local.php
# sed -i 's/db_name/oneplayce/;s/db_user/oneplayceu/;s/db_pass/oneplaycep/' /var/sites/oneplayce/config/db-local.php