#!/bin/bash

# Run init.sh to deploy certbot-s3-downloader timer and service

set -e

if [ ! `id -u` -eq 0 ];then
    echo Please use sudo to run install.sh!
    exit 1
fi

cp certbot-s3-downloader.conf /etc/default/certbot-s3-downloader
cp certbot-s3-downloader.sh /usr/local/bin/
chmod 755 /usr/local/bin/certbot-s3-downloader.sh

if [ ! -d "/usr/lib/systemd/system/" ]; then
    mkdir -p /usr/lib/systemd/system/
fi

cp certbot-s3-downloader.service certbot-s3-downloader.timer /usr/lib/systemd/system/

systemctl daemon-reload
systemctl enable certbot-s3-downloader.timer
systemctl restart certbot-s3-downloader.timer

echo Init success!
exit 0
