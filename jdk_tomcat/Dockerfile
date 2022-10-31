# JDK Tomcat Dockerfile
# Date: 2019年 04月 13日 星期六 12:31:06 CST

ARG version=7
FROM centos:$version

LABEL maintainer="x_hsky@163.com"

ARG jre_name=jdk1.8.0_202
ENV JAVA_HOME=/opt/jdk
COPY ./$jre_name /opt/jdk

ARG tomcat_version=8.5.55
ARG tomcat_links=http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v$tomcat_version/bin/apache-tomcat-$tomcat_version.tar.gz

ENV CATALINA_HOME=/opt/tomcat
ENV PATH $JAVA_HOME/bin:$CATALINA_HOME/bin:$PATH
ENV JAVA_OPTS="-server -XX:+AggressiveOpts -XX:+UseBiasedLocking -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true"

RUN yum install wget -y && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN wget $tomcat_links -P /opt/ && \
    tar -xf /opt/apache-tomcat-${tomcat_version}.tar.gz -C /opt/ && \
    mv /opt/apache-tomcat-${tomcat_version} /opt/tomcat && \
    rm -f /opt/apache-tomcat-${tomcat_version}.tar.gz && \
    rm -rf /opt/tomcat/webapps/* && \
    yum remove wget -y && \
    yum clean all

COPY ./server.xml /opt/tomcat/conf/server.xml

WORKDIR $CATALINA_HOME

VOLUME logs temp work webapps
STOPSIGNAL SIGKILL
EXPOSE 8080

CMD ["catalina.sh", "run"]
