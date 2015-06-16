FROM ubuntu:14.04

RUN apt-get update && \
  apt-get install -y apache2 apache2-utils libapache2-mod-qos libapache2-mod-log-slow libapache2-mod-bw && \
  rm /etc/apache2/sites-enabled/*
RUN a2enmod proxy && a2enmod proxy_http && a2enmod unique_id
COPY esproxy.conf /etc/apache2/sites-enabled/esproxy.conf
COPY start /start

EXPOSE 80
ENTRYPOINT ["/start"]

