#!/usr/bin/env bash

echo "Shutting down docker containers"

docker-compose -f /vagrant_data/docker-compose.yml down