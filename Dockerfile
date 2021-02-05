FROM golang:latest as websocketd
ENV CGO_ENABLED 0
RUN go get github.com/joewalnes/websocketd


FROM hackinglab/alpine-base:3.2 as nodebuild
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

ADD source /

RUN apk add --no-cache --update \
        nodejs \
        npm \
        sudo && \
        rm -rf /var/cache/apk/* && \
        addgroup -S node && adduser -S node -G node && \
        chown -R node:node /opt/nodejs && \
	cd /opt/nodejs && \
	npm i



FROM hackinglab/alpine-base:3.2
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

COPY --from=nodebuild /opt/nodejs /opt/nodejs
COPY --from=websocketd /go/bin/websocketd /usr/bin/websocketd

# Add the files
ADD root /

RUN apk add --no-cache --update \
        nodejs \
        npm \
        sudo \
        nginx \
        dcron \
        apache2-utils \
        openssl && \
	addgroup -S node && adduser -S node -G node && \
	chown -R nginx:www-data /var/lib/nginx && \
	chown -R nginx:www-data /opt/www && \
	chown -R node:node /opt/nodejs && \
	chown -R node:node /opt/data && \
	rm -rf /var/cache/apk/* 

#USER node
# Expose the ports for nginx
EXPOSE 80
