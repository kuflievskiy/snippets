
##################################################################################################
# Docker
##################################################################################################

# how to install Docker
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-getting-started

# start Docker
sudo service docker start

# login, pull, run , logout commands
# https://docs.docker.com/engine/reference/commandline/login/
sudo docker login -u='kuflievskiy' -p='XXXXX'
sudo docker pull ebakep/ubuntu
sudo docker run -it ebakep/ubuntu
sudo docker logout

# leave the process tty, but keep it active
CTRL q+p

# Commit changes in docker image
sudo docker commit b4134539b8d6 ebakep/php
# Push changes
sudo docker push ebakep/php

# open the process tty
sudo docker exec -it a8d47d49f762 /bin/bash

# stop and remove all docker containers from local machine
sudo docker ps -a
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)

# TODO : https://serversforhackers.com/getting-started-with-docker


sudo docker rm $(sudo docker stop $(sudo docker ps -a -q))


#### https://hub.docker.com/r/davert/selenium-env/

git clone https://github.com/Codeception/SeleniumEnv.git .
docker build -t selenium-env .
#Or
docker pull davert/selenium-env

#Accessing Remote Website
docker run -i -t -p 4444:4444 davert/selenium-env

#Accessing Local Website by Port
php -S 0.0.0.0:8000 &
docker run -i -t -p 4444:4444 -e APP_PORT=8000 davert/selenium-env

#Accessing Local Website by Host
docker run -i -t -p 4444:4444 -e APP_HOST=myapp davert/selenium-env



#### https://hub.docker.com/r/davert/phantomjs-env/
docker pull davert/phantomjs-env

# Accessing Remote Website
docker run -i -t -p 4444:4444 davert/phantomjs-env

# Accessing Local Website by Port
php -S 0.0.0.0:8000 &
docker run -i -t -p 4444:4444 -e APP_PORT=8000 davert/phantomjs-env

# Accessing Local Website by Host
docker run -i -t -p 4444:4444 -e APP_HOST=myapp davert/phantomjs-env

@url https://stackoverrun.com/ru/q/10891472
When you mount a folder from host to container, the host folder content prevails and you won't see container folders that were created **before** the mounting.