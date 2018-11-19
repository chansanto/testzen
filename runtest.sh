#!/bin/bash


#run it before run runapp.sh script

sudo docker-compose exec php-fpm bash -c "vendor/bin/phpunit"
sudo docker-compose exec php-fpm bash -c "npm run test-js"

