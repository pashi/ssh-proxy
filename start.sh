#!/bin/sh

adduser -h /home/proxy -S -D -s /bin/ash proxy
P=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo $P
echo "proxy:${P}"|chpasswd -c sha256
mkdir -p /home/proxy/etc/ssh/ /home/proxy/.ssh
ssh-keygen -A -f /home/proxy
cat /keys.txt > /home/proxy/.ssh/authorized_keys
chmod 600 /home/proxy/.ssh/authorized_keys
chown -R proxy:nobody /home/proxy
/usr/sbin/sshd -D -f /etc/ssh/sshd_config
