FROM jruby

ENV VERSION "1.5"
#ENV USE_RUBY 1
RUN apt-get update && apt-get install -y vim git
#RUN mkdir -p /opt/logstash && curl -L http://download.elastic.co/logstash/logstash/logstash-1.5.0.rc2.tar.gz | tar xfz - -C /opt/logstash --strip-components=1
RUN git clone -b "$VERSION" https://github.com/elastic/logstash /opt/logstash
RUN git clone -b "update_api" https://github.com/Da-Wei/logstash-output-elasticsearch /src/logstash-output-elasticsearch
RUN cd /opt/logstash && cp Gemfile.defaults Gemfile
RUN cd /opt/logstash && rake bootstrap
RUN sed -i 's/.*\(logstash-output-elasticsearch\).*/gem \"\1\", :path => \"\/src\/\1\"/' /opt/logstash/Gemfile
RUN cd /opt/logstash && bin/plugin install --no-verify

ENV LANG fr_FR.UTF-8
ENTRYPOINT ["/opt/logstash/bin/logstash"]
