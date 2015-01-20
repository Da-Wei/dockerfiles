FROM dawei/java

RUN \
cd /tmp && \
wget http://download.elasticsearch.org/logstash/logstash/logstash-1.5.0.beta1.tar.gz && \
tar xvzf logstash-1.5.0.beta1.tar.gz && \
rm -f logstash-1.5.0.beta1.tar.gz && \
mv /tmp/logstash-1.5.0.beta1 /logstash
COPY upsert.patch /logstash/vendor/bundle/jruby/1.9/gems/logstash-output-elasticsearch-0.1.9-java/lib/logstash/outputs/elasticsearch/upsert.patch
RUN apt-get update && \
  apt-get install patch && \
  cd /logstash/vendor/bundle/jruby/1.9/gems/logstash-output-elasticsearch-0.1.9-java/lib/logstash/outputs/elasticsearch && \
  patch protocol.rb < upsert.patch
ENV LANG fr_FR.UTF-8
ENTRYPOINT ["/logstash/bin/logstash"]
