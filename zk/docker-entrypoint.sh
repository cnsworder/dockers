#!/usr/bin/env bash
IP=`ip address show dev eth0 | sed -n '3p' | awk '{print $2}' | awk  -F/ '{print $1}'`
export IP=$IP
confd -interval 5 -confdir /confd -backend consul -node 10.68.7.98:8500
