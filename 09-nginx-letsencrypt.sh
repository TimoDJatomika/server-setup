#!/bin/bash

if [[ -z "$1" ]]
        then echo "You must provide a domain name (e.g. example.tld)"
        exit
fi

echo '               .__                .__          __         ___________                                   __   '
echo '  ____    ____ |__| ____ ___  ___ |  |   _____/  |_  _____\_   _____/ ____   ___________ ___.__._______/  |_ '
echo ' /    \  / ___\|  |/    \\  \/  / |  | _/ __ \   __\/  ___/|    __)_ /    \_/ ___\_  __ <   |  |\____ \   __\'
echo '|   |  \/ /_/  >  |   |  \>    <  |  |_\  ___/|  |  \___ \ |        \   |  \  \___|  | \/\___  ||  |_> >  |  '
echo '|___|  /\___  /|__|___|  /__/\_ \ |____/\___  >__| /____  >_______  /___|  /\___  >__|   / ____||   __/|__|  '
echo '     \//_____/         \/      \/           \/          \/        \/     \/     \/       \/     |__|         '

echo "location /.well-known/acme-challenge {
	location ~ /.well-known/acme-challenge/(.*) {
		return	301	http://letsencrypt-auth.$1\$request_uri;
	}
}" | sudo tee /etc/nginx/conf.d/letsencrypt-auth.conf > /dev/null

echo "server {
	listen			80;
	listen			[::]:80;
	server_name		letsencrypt-auth.$1;
	root			/var/www/letsencrypt/letsencrypt-auth;
	default_type		text/plain;
}" | sudo tee /etc/nginx/sites-available/letsencrypt.$1 > /dev/null

sudo mkdir -p /var/www/letsencrypt/letsencrypt-auth/.well-known/acme-challenge
sudo chown -R www-data:www-data /var/www/letsencrypt
sudo ln -s /etc/nginx/sites-available/letsencrypt.$1 /etc/nginx/sites-enabled/001-letsencrypt.$1

sudo nginx -t

echo "If nginx syntax is ok, don´t forget to perform sudo service nginx restart"
