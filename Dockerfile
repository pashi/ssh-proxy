FROM alpine:latest
MAINTAINER pasi@pashi.net

RUN apk add --update openssh
ADD start.sh /

EXPOSE 22
ENTRYPOINT [ "/bin/sh", "/start.sh" ]
