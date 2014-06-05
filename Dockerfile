FROM    stackbrew/ubuntu:12.04
MAINTAINER <scott@likens.us>
RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install build-essential -y
ENV VERSION 2.8.9
RUN wget http://download.redis.io/releases/redis-${VERSION}.tar.gz -O /tmp/redis-${VERSION}.tar.gz && cd /tmp;tar zxf redis-${VERSION}.tar.gz
RUN cd /tmp/redis-${VERSION};make && make install
RUN mkdir /etc/redis && mkdir -p /data/
ADD redis.conf /etc/redis/redis.conf
ADD run /run
RUN chmod +x /run
RUN useradd -m redis
EXPOSE 6379
ENTRYPOINT ["/run"]
