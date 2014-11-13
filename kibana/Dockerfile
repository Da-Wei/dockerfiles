FROM dawei/java
# Install ElasticSearch.
RUN \
cd /tmp && \
wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA2.tar.gz && \
tar xvzf kibana-4.0.0-BETA2.tar.gz && \
rm -f kibana-4.0.0-BETA2.tar.gz && \
mv /tmp/kibana-4.0.0-BETA2 /kibana
COPY kibana.yml /kibana/config/kibana.yml
ENTRYPOINT ["/kibana/bin/kibana"]
EXPOSE 80
