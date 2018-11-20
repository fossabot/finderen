#!/usr/bin/env bash

CONFIG_FILE_PROJECT=$PWD/config/nginx/development/finderenloc.nginx
CONFIG_FILE_MACHINE=/etc/nginx/sites-enabled/finderenloc.nginx
CONFIG_FILE_MACHINE_PATH=/etc/nginx/sites-enabled/

HOSTS_RECORD="127.0.0.1 finderen.com.loc"
HOSTS_FILE=/etc/hosts

if [ -L "$CONFIG_FILE_MACHINE" ]
then
    echo "NGINX config already exists."
else
    if sudo ln -sf $CONFIG_FILE_PROJECT $CONFIG_FILE_MACHINE_PATH; then
        echo "Was created the symlink to NGINX config from the project."
        if sudo systemctl restart nginx; then
            echo "NGINX service was restarted."
        else
            echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
            echo "NGINX service wasn't restarted. Try to restart this one to the manual mode!"
            echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        fi
    else
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        echo "Wasn't created the symlink to NGINX config from the project. Try to add this one to the manual mode!"
        echo "Don't forget to restart NGINX service after adding the NGINX config."
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    fi
fi