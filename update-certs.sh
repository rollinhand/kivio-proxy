#!/usr/bin/env sh
echo "Stopping Nginx reverse proxy..."
docker stop kivio-proxy

echo "Renew certificate for depot.kivio.org..."
/opt/letsencrypt/letsencrypt-auto certonly --renew-by-default --standalone -d depot.kivio.org

echo "Starting Nginx reverse proxy..."
docker start kivio-proxy
