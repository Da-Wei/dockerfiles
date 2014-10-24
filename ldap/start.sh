#!/bin/sh
set -eu

cat <<EOF | debconf-set-selections
slapd slapd/internal/generated_adminpw password ${LDAP_ROOTPASS}
slapd slapd/internal/adminpw password ${LDAP_ROOTPASS}
slapd slapd/password2 password ${LDAP_ROOTPASS}
slapd slapd/password1 password ${LDAP_ROOTPASS}
slapd slapd/domain string ${LDAP_DOMAIN}
slapd shared/organization string ${LDAP_ORGANISATION}
EOF
# slapd slapd/dump_database_destdir string /var/backups/slapd-VERSION
# slapd slapd/backend string HDB
# slapd slapd/purge_database boolean true
# slapd slapd/move_old_database boolean true
# slapd slapd/allow_ldap_v2 boolean false
# slapd slapd/no_configuration boolean false
# slapd slapd/dump_database select when needed
# EOF
dpkg-reconfigure -f noninteractive slapd
/usr/sbin/slapd -h "ldap:///" -u openldap -g openldap
ldapadd -h localhost -p 389 -c -x -D "cn=admin,${LDAP_DOMAIN_DC}" -w "$LDAP_ROOTPASS" -f /data/ldap.ldif
kill -TERM $(cat /var/run/slapd/slapd.pid)
sleep 5
/usr/sbin/slapd -h "ldap:///" -u openldap -g openldap -d 0
