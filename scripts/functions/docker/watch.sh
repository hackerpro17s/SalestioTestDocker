#!/bin/bash

docker-compose -p salestio -f ~/workspace/salestio/docker-compose.yml watch "$@"