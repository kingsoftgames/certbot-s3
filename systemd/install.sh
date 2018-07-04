#!/bin/bash

# Install systemd unit files of certbot-s3.

set -e

if [ ! `id -u` -eq 0 ];then
    echo 'Please run as root.'
    exit 1
fi

cp -v certbot-s3.conf /etc/default/certbot-s3
cp -v certbot-s3.service certbot-s3.timer /etc/systemd/system/

systemctl daemon-reload
systemctl enable certbot-s3.timer
systemctl restart certbot-s3.timer

echo Init success!
exit 0
