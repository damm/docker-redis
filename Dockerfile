FROM    ubuntu:latest
MAINTAINER <scott@likens.us>
RUN apt-get update
RUN apt-get install wget build-essential -y
ADD http://download.redis.io/releases/redis-2.8.8.tar.gz /tmp
WORKDIR /tmp/redis-2.8.8
RUN make && make install
RUN mkdir /etc/redis && mkdir -p /data/
ADD redis.conf /etc/redis/redis.conf
EXPOSE 6379
ENTRYPOINT ["/usr/local/bin/redis-server","/etc/redis/redis.conf"]
VOLUME ["/data/"]
