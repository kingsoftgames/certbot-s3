#!/bin/bash

# Install systemd unit files of certbot-s3.

set -e

if [ ! `id -u` -eq 0 ];then
    echo 'Please run as root.'
    exit 1
fi

cp -v certbot-s3.conf /etc/default/certbot-s3
cp -v certbot-s3.service certbot-s3.timer /etc/systemd/system/

# Only root can access this file,
# Because it contains sensitive data like AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
chmod 600 /etc/default/certbot-s3

systemctl daemon-reload
systemctl enable certbot-s3.timer
systemctl restart certbot-s3.timer

echo Init success!
exit 0
