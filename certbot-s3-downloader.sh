#!/bin/bash

# Certbot s3 downloader shell
SOURCE_DIR=$1

if [ ! -f "$SOURCE_DIR" ]; then
    echo "Certbot-s3-downloader source file do not exists, please check and try again!"
    exit 1
fi

source $SOURCE_DIR

if [ -z "$S3_CERTIFICATES_URI" ]; then
    echo "S3_CERTIFICATES_URI not set, exit!"
    exit 1
fi

if [ -z "$DOWNLOAD_TARGET_DIR" ]; then
    echo "DOWNLOAD_TARGET_DIR not set, exit!"
    exit 1
fi

aws s3 cp $S3_CERTIFICATES_URI $DOWNLOAD_TARGET_DIR --recursive

if [ "$?" -gt 0 ]; then
    echo "s3 download failed, please check source params."
    exit 1
fi

echo "Download success!"
exit 0

