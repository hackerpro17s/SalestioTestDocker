#!/bin/bash

echo "Starting build of docker containers..."

docker-compose -p tenorium -f ~/workspace/tenorium/docker-compose.yml build