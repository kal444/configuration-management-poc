#!/bin/sh

ipv4_url=https://www.cloudflare.com/ips-v4
ipv6_url=https://www.cloudflare.com/ips-v6
conf_file=./etc/nginx/conf.d/cloudflare-real-ip-mapping.conf

rm -f $conf_file

exec > $conf_file

echo "#cloudflare ip mapping"
curl -qs $ipv4_url | sed -e 's/^/set_real_ip_from /' -e 's/$/;/'
# enable this after nginx is upgraded
#curl -qs $ipv6_url | sed -e 's/^/set_real_ip_from /' -e 's/$/;/'
echo "real_ip_header CF-Connecting-IP;"
