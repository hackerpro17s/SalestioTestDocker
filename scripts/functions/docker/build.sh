#!/bin/bash

echo "Starting build of docker containers..."

docker-compose -p salestio -f ~/workspace/salestio/docker-compose.yml build