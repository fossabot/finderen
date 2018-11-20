#!/usr/bin/env bash

ROOT=$PWD

if [ -f $ROOT/.env.development ]; then
    echo "$ROOT/.env.development file already exist"
else
    if cp $ROOT/.env.development.example $ROOT/.env.development; then
        "$ROOT/.env.development file was created. Fill it by your own data!"
    else
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        echo "$ROOT/.env.development file wasn't created"
        echo "Create it manually and fill it then by your own data!"
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    fi
fi