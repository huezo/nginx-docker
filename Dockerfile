FROM ubuntu:latest

LABEL maintainer="Victor H. <huezohuezo.1990@gmail.com>"
MAINTAINER   Victor H. <huezohuezo.1990@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

#  NGINX Ubuntu 

RUN apt-get update 
RUN apt-get install nginx nginx-extras -y 

RUN ln -sf /dev/stdout /var/log/nginx/access.log 
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443


STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

