FROM golang:latest as websocketd
ENV CGO_ENABLED 0
RUN go get github.com/ibuetler/websocketd


FROM hackinglab/alpine-base:3.2
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

COPY --from=websocketd /go/bin/websocketd /usr/bin/websocketd

# Add the files
ADD root /

RUN apk add --no-cache --update \
        nodejs \
        npm \
        sudo \
        nginx \
        apache2-utils \
        openssl && \
	addgroup -S node && adduser -S node -G node && \
	cd /opt/nodejs && \
	npm i && \
	chown -R nginx:www-data /var/lib/nginx && \
	chown -R nginx:www-data /opt/www && \
	chown -R node:node /opt/nodejs && \
	chown -R node:node /opt/data && \
	rm -rf /var/cache/apk/* 

#USER node
EXPOSE 3000

