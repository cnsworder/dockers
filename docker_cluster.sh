#!/usr/bin/env bash


echo 'Run consul'
docker run -d -p 8400:8400 -p 8500:8500 -p 8600:53/udp -h consul --name consul progrium/consul -server -bootstrap

echo 'Run Swarm server'
docker run -d -name swarm --restart=always swarm manage consul://vsc3.vsct.io:8500/v1/kv/swarm
