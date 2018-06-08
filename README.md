# certbot-s3-downloader

## Introduction

This service should cooperate with [certbot-lambda](https://github.com/rog2/certbot-lambda) to download certificates from s3 bucket, otherwise you can also download other files.

## Instructions

Run `install.sh` with `sudo` to deploy this service.

## Tips

- Before run this service, please configure  `certbot-s3-downloader.conf`, include uri information (and aws credentials).
- If `.conf` file have changed, please rerun `install.sh`.
- Use IAM Roles is best practice.