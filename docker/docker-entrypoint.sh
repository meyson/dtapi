#!/bin/bash

APP="/var/www/html"

sed -i \
  -e "s|mysql:host=localhost;dbname=dtapi2|mysql:host=$MYSQL_HOST;dbname=$MYSQL_DATABASE|g" \
  -e "s|'username'   => 'dtapi'|'username'   => '$MYSQL_USER'|g" \
  -e "s|'password'   => 'dtapi'|'password'   => '$MYSQL_PASSWORD'|g" \
  "$APP/application/config/database.php"

exec "$@"
