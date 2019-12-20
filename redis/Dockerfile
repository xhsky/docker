# Redis Dockerfile
# Date: 2019年 04月 13日 星期六 12:31:32 CST

# Compiler Environment
ARG version=latest
FROM centos:$version AS builder

ARG redis_version=5.0.4

RUN yum install wget gcc gcc-c++ make -y
RUN wget http://download.redis.io/releases/redis-${redis_version}.tar.gz && \
    tar -xf redis-${redis_version}.tar.gz && \
    cd redis-${redis_version} && \
    make && make PREFIX=/data/redis install && \
    mkdir /data/redis/conf && cp redis.conf sentinel.conf /data/redis/conf/ && \
    mkdir /data/redis/logs /data/redis/data 

RUN echo -e "\n开始制作生产环境镜像\n"
    
# Production Environment 
FROM centos:$version
LABEL maintainer="x_hsky@163.com" 
ENV GOSU_VERSION 1.11

RUN useradd -u 500 -r redis && \
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \ 
  set -ex; \
	yum -y install epel-release; \
	yum -y install wget dpkg; \
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -O /usr/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /tmp/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
# verify the signature
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	gpg --batch --verify /tmp/gosu.asc /usr/bin/gosu; \
	rm -r "$GNUPGHOME" /tmp/gosu.asc; \
	chmod +x /usr/bin/gosu; \
# verify that the binary works
	gosu nobody true; \
	yum -y remove wget dpkg; \
	yum clean all 

    #echo -e "net.core.somaxconn=1024\nvm.overcommit_memory=1" >> /etc/sysctl.conf && \
    #echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local && \
    #chmod u+x /etc/rc.d/rc.local

COPY --chown=redis --from=builder /data/redis /opt/redis
COPY docker-entrypoint.sh /opt/redis/bin/
RUN chmod u+x /opt/redis/bin/docker-entrypoint.sh

#COPY --chown=redis redis.conf /opt/redis/conf/redis.conf
#COPY --chown=redis sentinel.conf /opt/redis/conf/sentinel.conf

VOLUME /opt/redis/data
VOLUME /opt/redis/logs
WORKDIR /opt/redis
EXPOSE 6379 26379

STOPSIGNAL SIGTERM

ENV PATH /opt/redis/bin:$PATH
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server", "conf/redis.conf"]

