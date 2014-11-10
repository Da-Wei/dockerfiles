FROM dawei/java

RUN \
cd /tmp && \
wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
tar xvzf logstash-1.4.2.tar.gz && \
rm -f logstash-1.4.2.tar.gz && \
mv /tmp/logstash-1.4.2 /logstash
RUN cd /logstash && ./bin/plugin install contrib
ENV LANG fr_FR.UTF-8
ENTRYPOINT ["/logstash/bin/logstash"]
