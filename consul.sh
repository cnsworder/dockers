#!/bin/bash
docker run -itd -p 8300:8300 --net=host vsc3.vsct.io/consul agent -server -advertise=10.68.7.101 -client=0.0.0.0  -bootstrap -ui