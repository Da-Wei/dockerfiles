FROM dawei/java
# Install ElasticSearch.
RUN \
cd /tmp && \
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.0.tar.gz && \
tar xvzf elasticsearch-1.4.0.tar.gz && \
rm -f elasticsearch-1.4.0.tar.gz && \
mv /tmp/elasticsearch-1.4.0 /elasticsearch

#ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# RUN cd /elasticsearch/ && ./bin/plugin -i elasticsearch/marvel/latest
RUN /elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf
RUN cd /tmp && wget https://github.com/elasticsearch/kibana/archive/v3.1.2.tar.gz && \
tar xvfz v3.1.2.tar.gz && mkdir -p /elasticsearch/plugins/kibana/_site && \
mv /tmp/kibana-3.1.2/src/* /elasticsearch/plugins/kibana/_site/. && rm -rf /tmp/kibana*
COPY elasticsearch.yml /elasticsearch/config/elasticsearch.yml
ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]
EXPOSE 9200
