#!/bin/bash
docker run --restart always -d -p 2376:2375 -v $(pwd)/cluster:/tmp/cluster vsc3.vsct.io/swarm manage file:///tmp/cluster
export DOCKER_HOST=10.68.7.101:2376