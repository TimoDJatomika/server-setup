#!/bin/bash

if [[ -z "$1" ]]
	then echo "You must provide a alt least one domain (e.g. example.com)"
	exit
fi

echo '.____           __ /\        ___________                                   __    _________                __  .__  _____.__               __                 '
echo '|    |    _____/  |)/ ______ \_   _____/ ____   ___________ ___.__._______/  |_  \_   ___ \  ____________/  |_|__|/ ____\__| ____ _____ _/  |_  ____   ______'
echo '|    |  _/ __ \   __\/  ___/  |    __)_ /    \_/ ___\_  __ <   |  |\____ \   __\ /    \  \/_/ __ \_  __ \   __\  \   __\|  |/ ___\\__  \\   __\/ __ \ /  ___/'
echo '|    |__\  ___/|  |  \___ \   |        \   |  \  \___|  | \/\___  ||  |_> >  |   \     \___\  ___/|  | \/|  | |  ||  |  |  \  \___ / __ \|  | \  ___/ \___ \ '
echo '|_______ \___  >__| /____  > /_______  /___|  /\___  >__|   / ____||   __/|__|    \______  /\___  >__|   |__| |__||__|  |__|\___  >____  /__|  \___  >____  >'
echo '        \/   \/          \/          \/     \/     \/       \/     |__|                  \/     \/                              \/     \/          \/     \/ '

for domain in "$@"
do
	domains+="-d $domain "
done

letsencrypt certonly --webroot -w /var/www/letsencrypt/letsencrypt-auth $domains