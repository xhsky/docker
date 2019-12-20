# ffmpeg Dockerfile
# Date: 2019年 04月 13日 星期六 12:31:32 CST

# Compiler Environment
ARG version=latest
FROM centos:$version AS builder

ARG ffmpeg_links=https://ffmpeg.org/releases/ffmpeg-4.1.3.tar.bz2

RUN yum install epel-release -y
RUN yum install wget bzip2 SDL2-devel yasm-devel gcc make -y
RUN wget $ffmpeg_links && \
    tar -xf ffmpeg*tar.bz2 -C /opt/ && \
    cd /opt/ffmpeg* && ./configure --prefix=/opt/ffmpeg && \
    make && make install
RUN echo -e "\n开始制作生产环境镜像\n"
    
# Production Environment 
FROM tomcat:1.0
LABEL maintainer="x_hsky@163.com" 

COPY  --from=builder /opt/ffmpeg /opt/ffmpeg
RUN yum install epel-release -y
RUN yum install libxcb SDL2 -y
RUN yum remove epel-release -y && yum clean all

WORKDIR /opt/ffmpeg

ENV PATH /opt/ffmpeg/bin:$PATH
STOPSIGNAL SIGKILL
CMD ["catalina.sh", "run"]
