#!/bin/bash

ldapadd -h localhost -p 389 -c -x -D cn=admin,dc=icdc,dc=local -w $LDAP_ROOTPASS -f /data/ldap.ldif
