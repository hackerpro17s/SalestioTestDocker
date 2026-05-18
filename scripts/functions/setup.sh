#!/bin/bash

echo "Updating/Inserting alias..."

if [ -f "$HOME/.bashrc" ]; then
    sed -i '/#Salestio/d' ~/.bashrc
    echo "source \$HOME/workspace/salestio/scripts/main_completion.sh #Salestio" >> ~/.bashrc
fi
    
if [ -f "$HOME/.zshrc" ]; then
    sed -i '/#Salestio/d' ~/.zshrc
    echo "source \$HOME/workspace/salestio/scripts/main_completion.sh #Salestio" >> ~/.zshrc
fi

echo "Updating /etc/hosts... (need privileged access)"
sudo sed -i '/#Salestio/d' /etc/hosts
echo "127.0.0.1 salestio.tenorium.local #Salestio" | sudo tee -a /etc/hosts >> /dev/null

FUNCTIONS_PATH="$( dirname -- "$0";)"
MAIN_SCRIPT_PATH="$( dirname -- "$FUNCTIONS_PATH";)/main.sh"

$MAIN_SCRIPT_PATH clone
$MAIN_SCRIPT_PATH mkcert salestio.tenorium.local
$MAIN_SCRIPT_PATH up
cp ~/workspace/salestio/www/site/.env.docker ~/workspace/salestio/www/site/.env

echo "Waiting for MySQL..."
until docker-compose exec -T db mariadb-admin ping -h "localhost" --silent; do
    echo -n "."
    sleep 1
done
echo "Database ready"

$MAIN_SCRIPT_PATH composer install -o --no-interaction
$MAIN_SCRIPT_PATH artisan migrate --seed --no-interaction
$MAIN_SCRIPT_PATH build
