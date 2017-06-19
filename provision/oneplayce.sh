#!/bin/sh

# Setup REQUIRED SOFTWARE for OnePlayce
sudo add-apt-repository -y ppa:kirillshkrogalev/ffmpeg-next
sudo apt-get update
sudo apt-get install -y --force-yes ffmpeg

# Copy OnePlayce VirtualHost
sudo cp -fRv /vagrant/conf/sites-available/service.oneplayce.conf /etc/apache2/sites-available/

# Enable OnePlayce VirtualHost
sudo a2ensite service.oneplayce.conf

# Reload apache to catch OnePlayce VirtualHost
sudo service apache2 reload

# Install composer packages
sudo composer self-update
sudo composer global require "fxp/composer-asset-plugin:~1.1.1" --no-progress
sudo composer install --prefer-dist --no-progress --no-interaction --working-dir /var/www/oneplayce

# Setup OnePlayce database
cat /vagrant/database/oneplayce.sql | mysql -uroot -proot
sudo cp -n /var/www/oneplayce/config/db-local-sample.php /var/www/oneplayce/config/db-local.php
sed -i 's/db_name/oneplayce/;s/db_user/oneplayceu/;s/db_pass/oneplaycep/' /var/www/oneplayce/config/db-local.php

# Setup required local configurations
sudo cp -n /var/www/oneplayce/config/params-local-sample.php /var/www/oneplayce/config/params-local.php

sudo echo 'export PHP_IDE_CONFIG="serverName=OnePlayce Console Debug"' >> /home/vagrant/.bashrc

# Migrate database
php /var/www/oneplayce/yii migrate --interactive=0

# Setup RBAC
php /var/www/oneplayce/yii rbac/init --interactive=0

# Notify user to setup correct social API keys for project
cat /vagrant/misc/social-api-keys-warning 
