#!/bin/sh

/usr/bin/ssh-keygen -A
adduser -S -u 5005 tunnel
mkdir -p /home/tunnel/.ssh
if [ -f /key ]
then
cp /key /home/tunnel/.ssh/authorized_keys
fi

chown -R tunnel /home/tunnel/
chmod 700 /home/tunnel/.ssh
chmod 600 /home/tunnel/.ssh/authorized_keys

PASS=$(echo -n "tunnel:" ; < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo)
echo "${PASS}"
echo "${PASS}" | chpasswd

exec /usr/sbin/sshd -D
