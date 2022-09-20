#!/bin/bash

echo "Updating/Inserting alias..."

sed -i '/#Tenorium/d' ~/.bashrc
echo "alias tenorium='~/workspace/tenorium/scripts/tenorium.sh' #Tenorium" >> ~/.bashrc

echo "Updating /etc/hosts... (need privileged access)"
sudo sed -i '/#Tenorium/d' /etc/hosts
echo "127.0.0.1 api.tenorium.local tenorium.local sso.tenorium.local #Tenorium" | sudo tee -a /etc/hosts >> /dev/null