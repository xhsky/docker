# Tomcat Dockerfile
# Date: 2019年 04月 13日 星期六 12:31:06 CST

ARG version=1.0
FROM jre:$version

LABEL maintainer="x_hsky@163.com"
ARG tomcat_links=http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
ARG tomcat_version=8.5.40

ENV CATALINA_HOME=/opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV JAVA_OPTS="-server -XX:+AggressiveOpts -XX:+UseBiasedLocking -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true"

RUN yum install wget -y
RUN wget $tomcat_links -P /opt/ && \
    tar -xf /opt/apache-tomcat-${tomcat_version}.tar.gz -C /opt/ && \
    mv /opt/apache-tomcat-${tomcat_version} /opt/tomcat && \
    rm -f /opt/apache-tomcat-${tomcat_version}.tar.gz && \
    rm -rf /opt/tomcat/webapps/* && \
    yum remove wget -y && \
    yum clean all

WORKDIR $CATALINA_HOME
# copy redis jar to tomcat libs
COPY tomcat_8.5_jar lib/
COPY webapp webapps/ROOT/

VOLUME logs temp work
STOPSIGNAL SIGKILL
EXPOSE 8080

CMD ["catalina.sh", "run"]
