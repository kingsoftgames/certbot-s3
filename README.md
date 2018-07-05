# certbot-s3

This repository is designed to work with [certbot-lambda](https://github.com/rog2/certbot-lambda) to download certificates monthly from AWS S3.

## Usage

### Cron

1.  Fill in required environment variables in `cron/certbot-s3`.

2. Run `sudo cron/install.sh` to install.

### Systemd

1.  Fill in required environment variables in `systemd/certbot-s3.conf`.

2. Run `sudo systemd/install.sh` to install.

3. Run `sudo systemctl start certbot-s3.service` to sync certificates now.

## Notes on EC2

Prefer IAM role on EC2 instances.

In this case, you should only fill in the `AWS_DEFAULT_REGION` variable, leaving `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` commented out.
