#!/bin/sh
ssh-keygen -A
# Remove conflicting AuthorizedKeysFile line
sed -i '/AuthorizedKeysFile/d' /etc/ssh/sshd_config
exec /usr/sbin/sshd -D -e -o AuthorizedKeysFile=/home/proxy_user/.ssh/authorized_keys "$@"
