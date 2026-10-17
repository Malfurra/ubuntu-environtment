#!/bin/bash
set -e

sudo apt update && sudo apt upgrade -y

sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

sudo apt install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql

sudo apt install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

sudo a2enmod rewrite
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

sudo systemctl restart apache2
