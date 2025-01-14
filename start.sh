#!/bin/sh -e
if [ -d "/root/.config/" ]; then
  rm -rf /root/.config/
  mkdir -p /root/.config
  ln -s /data/.config /root/.config
fi
echo "root:$ROOT_PASSWORD" | chpasswd
ssh-keygen -A
exec /usr/sbin/sshd -D -e "$@"
