# alpine-nginx-nodejs-websocketd
Alpine Docker Image with NGINX, NodeJS, WebSocketd
* problem: libwebsockets without -DLWS_WITH_LIBUV=ON breaks ttyd package
* fixing the problem with https://github.com/void-linux/void-packages/issues/19441
* fixing the problem with https://gitlab.alpinelinux.org/alpine/aports/-/issues/11936
* fixing the problem: libwebsockets context creation failed

## Building and Testing
```
docker-compose up --build
```

connect your browser to locahost

## Change Script that is being launched
please edit the following script. It is CGI env aware. Keep this in mind. 

```
root/opt/scripts/deploy-task
```


## Prepare for Hacking-Lab
you must copy the config.json.hl to config.json to make it ready for Hacking-Lab, because a FQDN is needed in HL (not localhost)

```
cp source/opt/nodejs/config.json.hl source/opt/nodejs/config.json
```




