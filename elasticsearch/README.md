# What is Elasticsearch?

Elasticsearch is a search server based on Lucene. It provides a distributed, multitenant-capable full-text search engine with a RESTful web interface and schema-free JSON documents.

## Links
* [Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/1.5/index.html)
* [Issues](https://github.com/elastic/elasticsearch/pulls?q=label%3Av1.5.2)

# Notes
Installed plugins :
* Kopf
* Kibana 3
* Marvel (agent disabled by default)

# How to use this image

You can run the default `elasticsearch` command simply:

  docker run -d elasticsearch

You can also pass in additional flags to `elasticsearch`:

  docker run -d elasticsearch -Des.cluster.name="mycluster"

This image comes with a default set of configuration files for `elasticsearch`, but if you want to provide your own set of configuration files, you can do so via a volume mounted at `/opt/elasticsearch/config`:

  docker run -d -v "$PWD/config":/opt/elasticsearch/config elasticsearch

This image is configured with a volume at `/opt/elasticsearch/data` to hold the persisted index data. Use that path if you would like to keep the data in a mounted volume:

  docker run -d -v "$PWD/esdata":/opt/elasticsearch/data elasticsearch

This image includes `EXPOSE 9200 9300` ([default `http.port`](http://www.elastic.co/guide/en/elasticsearch/reference/1.5/modules-http.html)), so standard container linking will make it automatically available to the linked containers.

If you need to expose elasticsearch outside the docker host you need to publish port 9200 and 9300 and set the elasticsearch "es.network.publish_host" to the hostname or ip of the docker host:

  docker run -d -p 9200:9200 -p 9300:9300 elasticsearch -Des.network.publish_host=host_ip

You can set specific parameter with environment variables like java heap memory :

  docker run -d -e ES_HEAP_SIZE=8g elasticsearch
