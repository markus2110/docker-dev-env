#!/usr/bin/env bash

echo "Starting the docker images"

docker-compose -f /vagrant_data/docker-compose.yml up $1 -d