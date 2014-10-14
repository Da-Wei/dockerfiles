FROM dawei/java

RUN \
cd /tmp && \
wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
tar xvzf logstash-1.4.2.tar.gz && \
rm -f logstash-1.4.2.tar.gz && \
mv /tmp/logstash-1.4.2 /logstash

ENTRYPOINT ["/logstash/bin/logstash"]
