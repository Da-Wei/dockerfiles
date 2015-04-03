FROM dawei/java
# Install ElasticSearch.
COPY build.sh /build/build.sh
RUN /build/build.sh && rm -rf /build
ENV ES_DEFAULT_SHARDS 1
ENV ES_DEFAULT_REPLICAS 0
ENV ES_MIN_MEM 1024m
ENV ES_MAX_MEM 1024m
ENV ES_PUBLISH_HOST ""
COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
COPY start /start
ENTRYPOINT ["/start"]
EXPOSE 9200
