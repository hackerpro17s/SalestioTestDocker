#!/bin/bash

service=$1
args=("${@:2}")

echo "Executing command... in $service"

docker-compose -p salestio -f ~/workspace/salestio/docker-compose.yml exec -u user -it "$service" bash "${args[@]}"