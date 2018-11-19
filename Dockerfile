FROM phpdockerio/php72-fpm:latest
WORKDIR "/application"

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y install php7.2-mysql \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install git
RUN apt-get update \
    && apt-get -y install git \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install node
RUN apt-get update && apt-get install -y npm 
RUN npm install -g yarn
RUN yarn install


# Update Composer
RUN composer self-update
RUN composer config --global repo.packagist composer https://packagist.org

EXPOSE 9000
CMD ["php-fpm"]
