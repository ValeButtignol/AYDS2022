# AYDS2022

Proyecto AYDS

Integrantes:

* Valentín Buttignol 43228027
* José Compagnucci 41525147
* Ignacio Romero 44204074

## Useful commands

* Run the server: ```rackup -p "Port Number"```
* Install gems from Gemfile: ```bundle install```
* Run docker commands if got permission denied: ```sudo chmod 666 /var/run/docker.sock```
* Solving docker permissions error: ```sudo aa-remove-unknown```
* Run the interpreter: ```docker compose exec app bundle exec irb -I. -r app/controllers/server.rb```

\*Commands GitHub:\*
* Pull without erasing my data : ```git add .```
                                ```git stash```
                                ```git pull```
                                ```git stash pop```


\*DB Commands:\*

* Run Migrations: ```docker compose exec app bundle exec rake db:migrate```
* Rollback Migration: ```docker compose exec app bundle exec rake db:rollback```
* Create Migration: ```docker compose exec app bundle exec rake db:migration_name NAME=create_players```
* Reset BD: ```docker compose exec app bundle exec rake db:reset```

\*Docker Commands:\*

* Build an image from a Dockerfile: ```docker build -t "Image Name" .```
* Run the containers generated in docker-compose on background: ```docker-compose up -d```
* Stop the running containters in docker-compose: ```docker-compose down```
* Show the running containers: ```docker ps```
* Show the executed containers: ```docker ps -a```
* Execute a command from a running container: ```docker exec```

* Depending on the container, you can stay connected to it: ```docker exec -it "Container ID" /bin/sh```

* Run a container from an image on background iteratively: ```docker run -d -it "Container Name"```

* Run a container from an image on background: ```docker run -d "Container Name"```
* Run a container from an image: ```docker run "Container Name"```
* Download an image but don't execute it: ```docker pull "Image Name"```
* Start a container on background: ```docker start "Container ID"```
* Stop a container on background: ```docker stop "Container ID"```
