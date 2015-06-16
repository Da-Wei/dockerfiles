FROM dawei/base
RUN apt-get update && apt-get -y install libpcap0.8
RUN mkdir -p /opt/packetbeat && curl -s -L https://download.elastic.co/beats/packetbeat/packetbeat-1.0.0~Beta1-x86_64.tar.gz |tar xvzC /opt/packetbeat --strip-components=1
copy packetbeat.yml /opt/packetbeat/packetbeat.yml
COPY start /start
ENTRYPOINT ["/start"]
