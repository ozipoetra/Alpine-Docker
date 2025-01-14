#!/bin/sh -e
if [ ! -d "/data/.config/" || ! -d "/data/.ssh/" ]; then
  mkdir -p /data/.config
  mkdir -p /data/.ssh
fi
if [ -d "/root/.config/" ]; then
  rm -rf /root/.config/
  rm -rf /root/.ssh/
  ln -s /data/.config /root/
  ln -s /data/.ssh /root/
fi
if [ -d "/data/.config/gh" ]; then
  while sleep 30; do sh -c "gh cs ssh --repo code50/41739417"; done
fi
echo "root:$ROOT_PASSWORD" | chpasswd
ssh-keygen -A
exec /usr/sbin/sshd -D -e "$@"
