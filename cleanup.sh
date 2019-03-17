#!/bin/bash

docker system prune
docker volume prune

# Delete all containers
docker rm -f $(docker ps -a -q)

# Delete all images
docker rmi -f $(docker images -q)


