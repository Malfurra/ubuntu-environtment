#!/bin/bash
set -e

sudo apt update && sudo apt upgrade -y

sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx

sudo apt install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql

apt install nginx mariadb-server php-fpm php-mysql php-cli php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip unzip -y

PHP_VER=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;")
sudo systemctl enable php${PHP_VER}-fpm
sudo systemctl start php${PHP_VER}-fpm

sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

sudo systemctl restart nginx
