#!/bin/sh

set -e

# Install docker
curl -sSL https://get.docker.com/ubuntu/ | sh

# Install fig
curl -L https://github.com/docker/fig/releases/download/1.0.0/fig-`uname -s`-`uname -m` > /usr/local/bin/fig
chmod +x /usr/local/bin/fig

# Add a swap file
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile   none    swap    sw    0   0' >> /etc/fstab
