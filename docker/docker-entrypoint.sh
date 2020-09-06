#!/bin/bash

APP="/var/www/html/api"
sed -i -e "s|RewriteBase /|RewriteBase /api|g" "$APP/.htaccess"
sed -i -e "s|'base_url'   => '/'|'base_url'   => '/api/'|g" "$APP/application/bootstrap.php"
sed -i \
  -e "s|mysql:host=localhost;dbname=dtapi2|mysql:host=$MYSQL_HOST;dbname=$MYSQL_DATABASE|g" \
  -e "s|'username'   => 'dtapi'|'username'   => '$MYSQL_USER'|g" \
  -e "s|'password'   => 'dtapi'|'password'   => '$MYSQL_PASSWORD'|g" \
  "$APP/application/config/database.php"

# The GKE Ingress controller won't work without index.html in root directory
touch "/var/www/html/index.html"
exec "$@"
