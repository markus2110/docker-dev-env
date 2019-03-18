#!/usr/bin/env bash

echo "Try to upgrade docker and docker-compose to the latest version"

sudo apt-get update && apt-get install docker \
    && sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && echo "" \
    && echo "" \
    && echo "---------------------------------------" \
    && docker --version \
    && echo "---------------------------------------" \
    && docker-compose version \
    && echo "---------------------------------------"