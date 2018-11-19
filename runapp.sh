#!/bin/bash

containerID=`sudo docker ps | grep php-fpm |  awk '{print $1}'`

sudo docker cp .env.example $containerID:/application/.env
sudo docker cp phpunit.xml $containerID:/application/
sudo chmod 777 -R ./qa-test/storage

sudo docker-compose exec php-fpm bash -c "yarn install"

sudo docker-compose exec php-fpm bash -c "composer install"

sudo docker-compose exec php-fpm bash -c "php artisan migrate --force"


#docker-compose exec php-fpm bash -c "npm run prod" #for production css, js file
sudo docker-compose exec php-fpm bash -c "npm run dev"

sudo docker-compose exec php-fpm bash -c "php artisan key:generate"
