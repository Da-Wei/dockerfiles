FROM dawei/base

ENV HOME /root

ENV LDAP_DOMAIN test.local
ENV LDAP_DOMAIN_DC dc=test,dc=local
ENV LDAP_ORGANISATION Test
ENV LDAP_ROOTPASS admin

RUN apt-get -y update && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y slapd ldap-utils && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 389

COPY ldap.ldif /data/ldap.ldif

COPY start.sh /start.sh
CMD ["/start.sh"]
