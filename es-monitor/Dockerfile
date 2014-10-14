FROM dawei/elasticsearch
RUN echo 'marvel.agent.enabled: false' >> /elasticsearch/config/elasticsearch.yml
RUN cd /elasticsearch/ && ./bin/plugin -i elasticsearch/marvel/latest
