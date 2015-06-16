FROM dockerfile/java:oracle-java8

ENV ES_DOWNLOAD_SHA1 ffe2e46ec88f4455323112a556adaaa085669d13

# Install ElasticSearch.
RUN cd /tmp && \
  curl -fSL -o elasticsearch.tar.gz "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.5.2.tar.gz" && \
  echo "$ES_DOWNLOAD_SHA1  elasticsearch.tar.gz" | sha1sum -c - && \
  mkdir -p /opt/elasticsearch && \
  tar xfvz elasticsearch.tar.gz -C /opt/elasticsearch --strip-components=1 && \
  rm elasticsearch.tar.gz

# Install elasticsearch plugins
RUN /opt/elasticsearch/bin/plugin --install elasticsearch/marvel/latest && \
  /opt/elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf && \
  mkdir -p /opt/elasticsearch/plugins/kibana/_site && \
  curl -s -L https://github.com/elasticsearch/kibana/archive/v3.1.2.tar.gz \
  | tar xvzC /opt/elasticsearch/plugins/kibana/_site 'kibana-3.1.2/src' --strip-components=2

COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
EXPOSE 9200
EXPOSE 9300
