#!/usr/bin/env sh

while :
do
    /var/www/app/bin/console $1
    sleep $2
done
