# Nginx Dockerfile
# Date: 2019年 04月 13日 星期六 12:31:06 CST

ARG version=latest
FROM centos:$version

LABEL maintainer="x_hsky@163.com"

COPY nginx.repo /etc/yum.repos.d/

RUN useradd -u 500 -r nginx && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    yum install nginx -y && \
    rm -rf /var/cache/yum/

VOLUME /var/log/nginx 
WORKDIR /usr/share/nginx/html
EXPOSE 80 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

