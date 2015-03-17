#!/bin/bash

mkdir /opt/elasticsearch
curl -s -L https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz \
  | tar xvzC /opt/elasticsearch --strip-components=1

# RUN cd /elasticsearch/ && ./bin/plugin -i elasticsearch/marvel/latest
/opt/elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf

mkdir -p /opt/elasticsearch/plugins/kibana/_site
curl -s -L https://github.com/elasticsearch/kibana/archive/v3.1.2.tar.gz \
  | tar xvzC /opt/elasticsearch/plugins/kibana/_site 'kibana-3.1.2/src' --strip-components=2
