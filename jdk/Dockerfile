# Jre Dockerfile
# Date: 2019年 04月 13日 星期六 12:31:06 CST

ARG version=latest
FROM centos:$version

LABEL maintainer="x_hsky@163.com"
ARG jre_name=jdk1.8.0_202

ENV JAVA_HOME=/opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH

COPY ./$jre_name /opt/jdk/

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

WORKDIR $JAVA_HOME
CMD ["/bin/bash"]
