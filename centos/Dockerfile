# centos vm Dockerfile
# Date: 2022年 10月 20日 星期四 11:57:38 CST

ARG version=7
FROM centos:$version

LABEL maintainer="x_hsky@163.com"

#COPY nginx.repo /etc/yum.repos.d/

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    yum groupinstall Minimal Install -y && yum install vim wget -y && \
    rm -rf /var/cache/yum/ && \
    mkdir /dream && \
    echo 'set -o vi' >> /root/.bashrc && \
    echo 'bind -m vi-command ".":insert-last-argument' >> /root/.bashrc && \
    echo 'bind -m vi-insert "\c-l":clear-screen' >> /root/.bashrc

VOLUME /dream
WORKDIR /dream
EXPOSE 3081 3082 3083

STOPSIGNAL SIGTERM

CMD ["sleep", "360000"]

