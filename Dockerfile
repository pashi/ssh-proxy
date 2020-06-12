# 20200612
FROM alpine:latest
MAINTAINER pasi@pashi.net
RUN apk add --update openssh
ADD proxy_sshd_config /etc/ssh/sshd_config
ADD start.sh /start.sh
ADD keys.txt /keys.txt
EXPOSE 12022
CMD /start.sh
