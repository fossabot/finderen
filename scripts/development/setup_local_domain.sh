#!/usr/bin/env bash

HOSTS_RECORD="127.0.0.1 finderen.com.loc"
HOSTS_FILE=/etc/hosts

echo "Checking the file /etc/hosts"

if grep -qF "$HOSTS_RECORD" "$HOSTS_FILE"; then
    echo "File /etc/hosts already have our record."
else
    if echo "$HOSTS_RECORD" | sudo tee --append "$HOSTS_FILE"; then
        echo "/etc/hosts file was extended by our record."
    else
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        echo "/etc/hosts file wasn't extended by our record."
        echo "Try add this one to the manual mode!"
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    fi
fi