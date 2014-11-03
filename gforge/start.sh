#!/bin/bash

(cat <<EOF
gforge-db-postgresql  fusionforge/shared/admin_password_confirm password  
gforge-db-postgresql  fusionforge/shared/db_password  password  0256e8876dd3583880ff5dbae8d2baf5
gforge-web-apache2  fusionforge/shared/db_password  password  0256e8876dd3583880ff5dbae8d2baf5
gforge-db-postgresql  fusionforge/shared/admin_password password  ${GFORGE_PASSWORD}
gforge-db-postgresql  fusionforge/shared/db_password_confirm  password  
gforge-web-apache2  fusionforge/shared/db_password_confirm  password  
gforge-db-postgresql  fusionforge/shared/shell_host string  shell.$(echo $HOSTNAME)
gforge-web-apache2  fusionforge/shared/shell_host string  shell.$(echo $HOSTNAME)
gforge-db-postgresql  fusionforge/shared/statsadmin_groupid string  3
gforge-web-apache2  fusionforge/shared/statsadmin_groupid string  3
gforge-db-postgresql  fusionforge/shared/sys_theme  string  gforge
gforge-web-apache2  fusionforge/shared/sys_theme  string  gforge
gforge-db-postgresql  fusionforge/shared/db_user  string  gforge
gforge-db-postgresql  fusionforge/shared/db_name  string  gforge
gforge-db-postgresql  fusionforge/shared/ip_address string  $(hostname -I)
gforge-web-apache2  fusionforge/shared/ip_address string  $(hostname -I)
gforge-db-postgresql  fusionforge/shared/download_host  string  download.$(echo $HOSTNAME)
gforge-web-apache2  fusionforge/shared/download_host  string  download.$(echo $HOSTNAME)
gforge-mta-exim4  fusionforge/shared/noreply_to_bitbucket boolean true
gforge-common fusionforge/shared/server_admin string  webmaster@$(echo $HOSTNAME)
gforge-db-postgresql  fusionforge/shared/server_admin string  webmaster@$(echo $HOSTNAME)
gforge-mta-exim4  fusionforge/shared/server_admin string  webmaster@$(echo $HOSTNAME)
gforge-db-postgresql  fusionforge/shared/peerrating_groupid string  4
gforge-web-apache2  fusionforge/shared/peerrating_groupid string  4
gforge-common fusionforge/shared/domain_name  string  $(echo $HOSTNAME)
gforge-db-postgresql  fusionforge/shared/domain_name  string  $(echo $HOSTNAME)
gforge-mta-exim4  fusionforge/shared/domain_name  string  $(echo $HOSTNAME)
gforge-db-postgresql  fusionforge/shared/sys_lang select  French
gforge-web-apache2  fusionforge/shared/sys_lang select  French
gforge-db-postgresql  fusionforge/shared/users_host string  users.$(echo $HOSTNAME)
gforge-mta-exim4  fusionforge/shared/users_host string  users.$(echo $HOSTNAME)
gforge-web-apache2  fusionforge/shared/users_host string  users.$(echo $HOSTNAME)
gforge-common fusionforge/shared/system_name  string  FusionForge
gforge-db-postgresql  fusionforge/shared/system_name  string  FusionForge
gforge-mta-exim4  fusionforge/shared/system_name  string  FusionForge
gforge-web-apache2  fusionforge/shared/ftpuploadhost  string  upload.$(echo $HOSTNAME)
gforge-web-apache2  fusionforge/shared/jabber_host  string  jabber.$(echo $HOSTNAME)
gforge-web-apache2  fusionforge/shared/upload_host  string  upload.$(echo $HOSTNAME)
gforge-db-postgresql  fusionforge/shared/db_host  string  127.0.0.1
gforge-db-postgresql  fusionforge/shared/newsadmin_groupid  string  2
gforge-web-apache2  fusionforge/shared/newsadmin_groupid  string  2
gforge-db-postgresql  fusionforge/shared/lists_host string  lists.$(echo $HOSTNAME)
gforge-mta-exim4  fusionforge/shared/lists_host string  lists.$(echo $HOSTNAME)
gforge-web-apache2  fusionforge/shared/lists_host string  lists.$(echo $HOSTNAME)
EOF
) | debconf-set-selections
cat > /etc/fusionforge/fusionforge.conf <<EOF
system_name=FusionForge
domain_name=$(echo $HOSTNAME)
server_admin=webmaster@$(echo $HOSTNAME)
db_host=127.0.0.1
db_port=
db_name=gforge
db_user=gforge
db_password=0256e8876dd3583880ff5dbae8d2baf5
ip_address=$(hostname -I)
scm_host=scm.$(echo $HOSTNAME)
shell_host=shell.$(echo $HOSTNAME)
users_host=users.$(echo $HOSTNAME)
lists_host=lists.$(echo $HOSTNAME)
jabber_host=jabber.$(echo $HOSTNAME)
upload_host=upload.$(echo $HOSTNAME)
download_host=download.$(echo $HOSTNAME)
ftpuploadhost=upload.$(echo $HOSTNAME)
ftpuploaddir=/var/lib/gforge/chroot/ftproot
newsadmin_groupid=2
statsadmin_groupid=3
peerrating_groupid=4
template_project=5
admin_login=admin
admin_password=${ADMIN_PASSWORD:admin}
skill_list=Ada;C;C++;HTML;LISP;Perl;PHP;Python;SQL
default_trove_cat=18
ldap_host=localhost
ldap_base_dn=dc=$(echo $HOSTNAME)
ldap_web_add_password=a874adc7
sys_path_to_mailman=/usr/lib/mailman
cgidir=/usr/share/gforge/cgi-bin
cronolog_path=/usr/bin/cronolog
sys_sendmail_path=/usr/sbin/sendmail
sys_path_to_jpgraph=/usr/share/jpgraph/
sys_path_to_scmweb=/usr/share/gforge/bin/
gforge_chroot=/var/lib/gforge/chroot
gforge_etc=/etc/gforge
sys_custom_path=/etc/gforge/custom
groupdir=/home/groups
homedir=/home/users
cvsdir=/var/lib/gforge/chroot/cvsroot
svndir=/svnroot
uploaddir=/var/lib/gforge/download/
sys_urlroot=/usr/share/gforge/www/
sys_jabber_pass=bbaf96a8
usr_share_gforge=/usr/share/gforge
usr_lib_gforge=/usr/share/gforge
var_lib_gforge=/var/lib/gforge
var_log_gforge=/var/log/gforge
sys_show_source=0
sys_force_login=0
sys_session_key=7f980b3989094d83f6a2d744842207e2
sys_session_expire=60 * 60 * 24 * 7
sys_show_contact_info=1
sys_themeroot=/usr/share/gforge/www/themes/
sys_theme=gforge
sys_lang=English
sys_default_timezone=GMT
sys_default_country_code=US
sys_account_manager_type=pgsql
sys_use_jabber=0
sys_use_auth_ldap=1
sys_ldap_auth_port=389
sys_ldap_auth_version=3
sys_ldap_auth_dn=dc=$(echo $HOSTNAME)
sys_scm_tarballs_path=/var/lib/gforge/scmtarballs
sys_scm_snapshots_path=/var/lib/gforge/scmsnapshots
sys_use_scm=true
sys_use_tracker=true
sys_use_forum=true
sys_use_pm=true
sys_use_docman=true
sys_use_news=true
sys_use_mail=true
sys_use_survey=true
sys_use_frs=true
sys_use_fti=false
sys_use_ftp=true
sys_use_trove=true
sys_use_snippet=true
sys_use_shell=true
sys_use_ratings=true
sys_use_ssl=false
sys_use_people=true
sys_use_manual_uploads=false
sys_use_ftpuploads=false
sys_use_diary=true
sys_use_bookmarks=true
sys_use_project_tags=true
sys_use_project_full_list=true
sys_use_gateways=true
sys_use_project_vhost=true
sys_use_project_database=false
sys_use_project_multimedia=false
sys_use_private_project=true
sys_project_reg_restricted=false
sys_user_reg_restricted=false
sys_require_accept_conditions=false
sys_require_unique_email=false
sys_localinc=/etc/gforge/local.inc
sys_jabber_pass=bbaf96a8
sys_plugins_path=/usr/share/gforge/plugins/
sys_sslcrt=/etc/gforge/ssl-cert.pem
sys_sslkey=/etc/gforge/ssl-cert.key
noreply_to_bitbucket=true
sys_simple_dns=true
sys_apache_user=apache
sys_apache_group=apache
sys_forum_return_domain=$(echo $HOSTNAME)
sys_block_anonymous_downloads=false
sys_urlprefix=/
dovhost=true
EOF
/usr/sbin/fusionforge-config

service postgresql start
service cron start
service apache2 start

mkdir -p /var/run/sshd
/usr/sbin/sshd -D
