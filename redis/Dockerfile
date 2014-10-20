FROM ubuntu:14.04
RUN apt-get update && apt-get install -y redis-server && sed -i 's/^bind 127.0.0.1/# bind 127.0.0.1/' /etc/redis/redis.conf
ENTRYPOINT ["redis-server"]
EXPOSE 6379
