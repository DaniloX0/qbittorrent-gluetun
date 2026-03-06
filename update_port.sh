#!/bin/sh

PORT=$(grep -o "[0-9]\+" /gluetun/port_forward.txt)

if [ -z "$PORT" ]; then
  echo "Port forwarding port not found"
  exit 1
fi

wget -qO- --post-data "json={\"listen_port\":$PORT}" http://127.0.0.1:8080/api/v2/app/setPreferences
echo "Updating qBittorrent listen port to $PORT"

