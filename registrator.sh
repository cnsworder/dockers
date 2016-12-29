#!/bin/bash
docker run -idt -v /var/run/docker.sock:/tmp/docker.sock vsc3.vsct.io/registrator -cleanup=true -internal consulkv://10.68.7.85:8500/service
# docker run -idt -v /var/run/docker.sock:/tmp/docker.sock vsc3.vsct.io/registrator -cleanup=true -ip=10.68.7.101  consulkv://10.68.7.85:8500/service