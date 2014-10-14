FROM dawei/java
# Install ElasticSearch.
RUN \
cd /tmp && \
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.0.Beta1.tar.gz && \
tar xvzf elasticsearch-1.4.0.Beta1.tar.gz && \
rm -f elasticsearch-1.4.0.beta1.tar.gz && \
mv /tmp/elasticsearch-1.4.0.Beta1 /elasticsearch

#ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# RUN cd /elasticsearch/ && ./bin/plugin -i elasticsearch/marvel/latest

ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]
EXPOSE 9200
