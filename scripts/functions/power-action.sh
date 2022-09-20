#!/bin/bash

case "$1" in
"up")
docker-compose -p tenorium -f ~/workspace/tenorium/docker-compose.yml up
;;
"down")
docker-compose -p tenorium -f ~/workspace/tenorium/docker-compose.yml down
;;
"restart")
docker-compose -p tenorium -f ~/workspace/tenorium/docker-compose.yml restart
esac