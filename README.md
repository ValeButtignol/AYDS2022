# AYDS2022
Proyecto AYDS

Integrantes:
* Valentín Buttignol 43228027
* José Compagnucci 41525147
* Ignacio Romero 44204074


## Useful commands
* Run the server: _rackup -p "Port Number"_
* Install gems from Gemfile: _bundle install_
* Run docker commands if got permission denied: _sudo chmod 666 /var/run/docker.sock_


\*Docker Commands:\*
* Build an image from a Dockerfile: _docker build -t "Image Name" ._
* Run the containers generated in docker-compose on background: _docker-compose up -d_
* Stop the running containters in docker-compose: _docker-compose down_
* Show the running containers: _docker ps_
* Show the executed containers: _docker ps -a_
* Execute a command from a running container: _docker exec_

* Run an a container from an image on background: _docker run -d "Container Name"_
* Run an a container from an image: _docker run "Container Name"_
* Download an image but don't execute it: _docker pull "Image Name"_
* Start a container on background: _docker start "Container ID"_
* Stop a container on background: _docker stop "Container ID"_





