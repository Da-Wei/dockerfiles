FROM ubuntu:12.04

RUN apt-get update && apt-get install -y postgresql apache2 && service postgresql restart && service apache2 restart && DEBIAN_FRONTEND=noninteractive apt-get install -y fusionforge-full
