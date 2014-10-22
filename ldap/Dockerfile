FROM nickstenning/slapd

ENV LDAP_DOMAIN=icdc.local
ENV LDAP_ORGANISATION="ICDC"
ENV LDAP_ROOTPASS="admin"

RUN apt-get update
RUN apt-get install -y --force-yes ldap-utils
ADD ldap.ldif /data/ldap.ldif
ADD init.sh /data/init.sh
