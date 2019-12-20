# center Dockerfile
# Date: 2019年 04月 13日 星期六 12:31:06 CST

ARG version=1.0
FROM jre:$version

LABEL maintainer="x_hsky@163.com"

ENV openoffice_links=https://jaist.dl.sourceforge.net/project/openofficeorg.mirror/4.1.6/binaries/zh-CN/Apache_OpenOffice_4.1.6_Linux_x86-64_install-rpm_zh-CN.tar.gz
COPY *.jar /opt/
COPY docker-entrypoint.sh /opt/

# install openoffice
RUN yum install wget -y 
RUN mkdir /opt/tmp && cd /opt/tmp && \
    wget $openoffice_links && \
    tar -xf *.tar.gz && cd zh-CN/RPMS && \ 
    rpm -ivh *.rpm && cd desktop-integration/ && \
    rpm -ivh openoffice*redhat*.rpm && \
    cd /opt && rm -rf tmp && \
    chmod u+x /opt/docker-entrypoint.sh && \
    yum remove wget -y && \
    yum clean all

WORKDIR /opt/
EXPOSE 7101 7100

CMD ["/opt/docker-entrypoint.sh"]

