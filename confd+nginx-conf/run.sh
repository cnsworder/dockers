#!/bin/bash
echo nginx started...
/usr/sbin/nginx -c /etc/nginx/nginx.conf &
confd -interval 5 -confdir /etc/confd -backend consul -node 10.68.7.85:8500