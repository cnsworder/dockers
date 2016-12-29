#!/bin/bash
docker build -t confd-nginx-kv ./
docker run -itd -p 80:80 --net olnet confd-nginx-kv