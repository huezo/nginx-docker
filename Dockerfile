FROM ubuntu:latest

LABEL maintainer="Victor H. <huezohuezo.1990@gmail.com>"
MAINTAINER   Victor H. <huezohuezo.1990@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=America/El_Salvador

#  NGINX Ubuntu 

# Update the repository sources list
RUN apt-get update

# Instalacion NGINX 
RUN apt-get install nginx -y 

# Set the timezone.
ENV TZ=America/El_Salvador
RUN apt-get update 
RUN apt-get install -y tzdata 
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime 
RUN echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata


# Install nano
RUN apt-get install -y nano 

# Install  net-tools + curl + wget 
RUN apt-get install -y net-tools curl wget 

# ping

RUN apt install -y iputils-ping 

# nmap

RUN apt install -y nmap 

# vim

RUN apt-get install vim -y && apt-get clean




RUN ln -sf /dev/stdout /var/log/nginx/access.log 
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443


STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

