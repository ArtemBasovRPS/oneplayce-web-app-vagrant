#!/bin/sh

# Setup REQUIRED SOFTWARE for OnePlayce
sudo add-apt-repository -y ppa:kirillshkrogalev/ffmpeg-next
sudo apt-get update
sudo apt-get install -y ffmpeg

# Copy OnePlayce VirtualHost
sudo cp -fRv /vagrant/conf/sites-available/oneplayce.conf /etc/apache2/sites-available/

# Enable OnePlayce VirtualHost
sudo a2ensite oneplayce.conf

# Reload apache to catch OnePlayce VirtualHost
sudo service apache2 reload

# Install composer packages
sudo composer self-update
sudo composer global require "fxp/composer-asset-plugin:~1.1.1" --no-progress
sudo composer install --prefer-dist --no-progress --no-interaction --working-dir /var/sites/oneplayce

# Setup OnePlayce database
cat /vagrant/database/oneplayce.sql | mysql -uroot -proot
sudo cp -n /var/sites/oneplayce/config/db-local-sample.php /var/sites/oneplayce/config/db-local.php
sed -i 's/db_name/oneplayce/;s/db_user/oneplayceu/;s/db_pass/oneplaycep/' /var/sites/oneplayce/config/db-local.php

# Setup required local configurations
sudo cp -n /var/sites/oneplayce/config/params-local-sample.php /var/sites/oneplayce/config/params-local.php

# Migrate database
php /var/sites/oneplayce/yii migrate --interactive=0

# Setup RBAC
php /var/sites/oneplayce/yii rbac/init --interactive=0

# Notify user to setup correct social API keys for project
cat /vagrant/misc/social-api-keys-warning 
