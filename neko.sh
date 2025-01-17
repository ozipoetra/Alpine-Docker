#!/bin/sh
if [ ! -d "/data/.config/" ]; then
  mkdir -p /data/.config
  mkdir -p /data/.ssh
fi
if [ -d "/root/.config/" ]; then
  rm -rf /root/.config/
  rm -rf /root/.ssh/
  ln -s /data/.config /root/
  ln -s /data/.ssh /root/
fi
if pgrep -f "ozip" > /dev/null
then
    echo "bot is Running"
else
    cd /data/wabot
    screen -S wabot -t term ./ozip &
    echo "Starting bot..."
fi
while true
do
  gh cs ssh --repo code50/41739417 > neko.log &
  sleep 120
  pkill gh
done
