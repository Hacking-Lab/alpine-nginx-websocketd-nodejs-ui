#!/bin/bash
docker build --no-cache -t hackinglab/alpine-nginx-websocketd-nodejs-ui:$1.0 -t hackinglab/alpine-nginx-websocketd-nodejs-ui:$1 -t hackinglab/alpine-nginx-websocketd-nodejs-ui:latest -f Dockerfile .

docker push hackinglab/alpine-nginx-websocketd-nodejs-ui
docker push hackinglab/alpine-nginx-websocketd-nodejs-ui:$1
docker push hackinglab/alpine-nginx-websocketd-nodejs-ui:$1.0

