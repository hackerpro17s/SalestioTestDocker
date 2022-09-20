#!/bin/bash

case "$1" in
"up")
echo "Starting containers.."
docker-compose -p tenorium -f ~/workspace/tenorium/docker-compose.yml up -d
;;
"down")
echo "Stopping containers..."
docker-compose -p tenorium -f ~/workspace/tenorium/docker-compose.yml down
;;
"restart")
echo "Restarting containers..."
docker-compose -p tenorium -f ~/workspace/tenorium/docker-compose.yml restart
;;
esac