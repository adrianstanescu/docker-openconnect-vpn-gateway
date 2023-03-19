#!/bin/sh

# adapter error fix
cp /etc/resolv.conf /etc/resolv.conf.back
umount /etc/resolv.conf
cp /etc/resolv.conf.back /etc/resolv.conf

iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE

keepalive.sh &

exec start.sh
