## Getting Started

These instructions will give you everything you need for developing CRYPTLOCK WALLET UI application.

* NGINX
* PHP 7.2
* MySQL 5.7
* Source code (Laravel). Location: `qa-test` directory

After git clone the repo https://github.com/chansanto/testzen.git.

run command to update git submodule from repo zenroom qa-test
```
git submodule update --init --recursive

```



### Prerequisites

This complete stack run with docker and docker-compose (1.22 or higher).


* Install [Docker](https://docs.docker.com/install)

* Install [Docker Compose](https://docs.docker.com/compose/install/)

For mac users,

Use the old version of docker: https://download.docker.com/mac/stable/21090/Docker.dmg (Do not upgrade to newer version)

Mac operating system suffer performance issues due to osxfs. We can improve the disk access speed by using nfs instead. You can google about this and read about the technical details. To mount via nfs, click on the docker icon on the top of your desktop -> Preferences -> File Sharing (remove all mounted dirs except /tmp) -> Restart docker.

```
cd docker-mac-fix
sudo ./d4m-nfs.sh
# restart docker
docker-compose down
docker-compose up -d
```
If you have error from docker-compose up -d with error can not start mysql.
please remove comment for the line in docker-compose.yml file
user: mysql #remove comment if you run with MAC and has error with docker-compose



### Installing

1. Build/run containers with (with and without detached mode)

```bash
docker-compose build
docker-compose up -d
```

2. Prepare the app

* Run the script runapp.sh
- the script will be run install yarn dependcince and composer install, migrate databases, .....
```bash
root# bash runapp.sh
```

3. Launch the Zen App in CHROME by going to

```
https://localhost:8000
```


4. DB can be accessed easily from

```
http://localhost:8003
```

### Run Tests 
- All test Unit and Vue Test has added into runtest.sh script
```bash
root# bash runtest.sh
```

## Useful commands

```bash
# bash commands
docker-compose exec php-fpm bash

# install assets
docker-compose exec php-fpm bash -c "php bin/console asset:install"

# Check route
docker-compose exec php-fpm bash -c "php bin/console debug:router"

# Composer (e.g. composer update)
docker-compose exec php-fpm bash -c "composer update"

# MySQL commands
docker-compose exec mysql mysql -uhomestead -psecret

# View container logs
docker-compose logs "ID of container"

# Stops containers and removes containers, networks, volumes and images created by `up`
docker-compose down

# Delete all containers
docker rm $(docker ps -aq)

# Delete all images
docker rmi $(docker images -q)
```

