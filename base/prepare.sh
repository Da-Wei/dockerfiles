#!/bin/bash
export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/02apt-speedup

export INITRD=no
mkdir -p /etc/container_environment
echo -n no > /etc/container_environment/INITRD

## Enable Ubuntu Universe and Multiverse.
sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list
apt-get -y update

## Fix some issues with APT packages.
## See https://github.com/dotcloud/docker/issues/1024
dpkg-divert --local --rename --add /sbin/initctl
ln -sf /bin/true /sbin/initctl

dpkg-divert --local --rename --add /usr/bin/ischroot
ln -sf /bin/true /usr/bin/ischroot

echo "Europe/Paris" > /etc/timezone 
dpkg-reconfigure -f noninteractive tzdata

apt-get install -y --no-install-recommends apt-transport-https ca-certificates
apt-get install -y --no-install-recommends software-properties-common
apt-get dist-upgrade -y --no-install-recommends
apt-get -y update

apt-get install -y --no-install-recommends language-pack-fr
locale-gen fr_FR

apt-get install -y --no-install-recommends curl wget less vim psmisc zip git

apt-get clean
rm -rf /build
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
