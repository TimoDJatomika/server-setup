#!/bin/bash

echo '___________.__                              .__  .__   '
echo '\_   _____/|__|______   ______  _  _______  |  | |  |  '
echo ' |    __)  |  \_  __ \_/ __ \ \/ \/ /\__  \ |  | |  |  '
echo ' |     \   |  ||  | \/\  ___/\     /  / __ \|  |_|  |__'
echo ' \___  /   |__||__|    \___  >\/\_/  (____  /____/____/'
echo '     \/                    \/             \/           '

sudo ufw allow ssh
sudo ufw allow 1194/udp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

sudo ufw show added

echo "Enable firewall by sudo ufw enable"
