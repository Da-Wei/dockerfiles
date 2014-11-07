FROM dawei/base

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 php5 php5-sqlite php5-ldap sqlite3 unzip && apt-get clean
RUN sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Europe\/Paris/g' /etc/php5/cli/php.ini
RUN sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Europe\/Paris/g' /etc/php5/apache2/php.ini
RUN curl -L http://kanboard.net/kanboard-latest.zip -o /tmp/kanboard.zip && \
  unzip /tmp/kanboard.zip -d /tmp && \
  rm /var/www/html/* && \
  mv /tmp/kanboard/* /var/www/html/. && \
  chown -R www-data:www-data /var/www/html/data && \
  rm -r /tmp/kanboard.zip /tmp/kanboard
# COPY config.php /var/www/html/config.php
COPY start /start
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_DOCUMENTROOT /var/www

ENV API_TOKEN 99999999a3c9469bbae9047ba297488befb86a34f861b30ae046e2246bd5

ENTRYPOINT ["/start"]
EXPOSE 80
