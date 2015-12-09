#!/usr/bin/env bash
set -e

if [ "$EUID" != "0" ] ; then
  echo "Script must be run as root." >&2
  exit 1
fi

if which knife > /dev/null ; then
  echo "Chef is already installed"
  exit 0
fi

echo "Installing Chef repo for Ubuntu 12.04 LTS"

# https://downloads.chef.io/chef-server/ubuntu/
# https://downloads.chef.io/chef-client/ubuntu/

#wget -nv https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/precise/chef-server-core_12.2.0-1_amd64.deb
#dpkg -i chef-server-core_*.deb

wget -nv https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/10.04/x86_64/chef_12.4.3-1_amd64.deb
dpkg -i chef_*.deb
rm chef_*.deb

echo "Chef installed!"

