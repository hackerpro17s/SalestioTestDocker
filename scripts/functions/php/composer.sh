#!/bin/bash

docker-compose -p salestio -f ~/workspace/salestio/docker-compose.yml run --rm -u user php8.4 composer "$@"