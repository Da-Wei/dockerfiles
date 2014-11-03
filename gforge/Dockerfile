FROM ubuntu:12.04

RUN apt-get update && apt-get install -y postgresql apache2 && service postgresql restart && service apache2 restart && DEBIAN_FRONTEND=noninteractive apt-get install -y fusionforge-full
RUN rm /etc/apache2/sites-enabled/000-default

COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]
