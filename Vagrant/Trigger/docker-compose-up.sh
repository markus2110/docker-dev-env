#!/usr/bin/env bash

echo "Starting the docker containers"

docker-compose -f /vagrant_data/docker-compose.yml up $1 -d