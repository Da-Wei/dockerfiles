FROM dawei/java
RUN \
cd /tmp && \
curl -s -L https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz |tar xvzC /opt/kibana --strip-components=1
COPY kibana.yml /opt/kibana/config/kibana.yml
ENTRYPOINT ["/opt/kibana/bin/kibana"]
EXPOSE 80
