#!/bin/bash
docker run -idt -e "SERVICE_NAME=test_cleanup" -p 8080:8080 --net olnet vsc3.vsct.io/vs_tomcat