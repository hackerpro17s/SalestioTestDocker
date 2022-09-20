#!/bin/bash

echo "Building backend..."

docker-compose -p tenorium -f ~/workspace/tenorium/docker-compose.yml exec webserver bash -c "$(cat << EOF
cd /var/www/site &&
composer install &&
./artisan migrate
EOF
)"

echo "Building frontend..."

docker-compose -p tenorium -f ~/workspace/tenorium/frontend.docker.compose.yml run nodejs bash -c "$(cat << EOF
cd /var/www/site-front &&
npm install
npm run dev
EOF
)"