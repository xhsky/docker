FROM centos:7

RUN groupadd dinstall && useradd -g dinstall -m -d /home/dmdba -s /bin/bash dmdba && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 

COPY ./pkg /pkg

RUN cd /pkg/ && \
  chmod 755 DMInstall.bin && \
  ./DMInstall.bin -q /pkg/dm7_auto_install.xml && \
	rm -f DMInstall.bin

COPY ./run.sh /

ENV PATH /opt/dmdbms/bin:$PATH

		# 字符集选项。0 代表 GB18030,1 代表 UTF-8,2 代表韩文字符集 EUC-KR
ENV DM_CHARSET=1 \
		#初始化时设置 SYSDBA 的密码，默认为 SYSDBA
    DM_SYSDBA_PWD="DreamSoft_123" \
    # 初始化时设置 SYSAUDITOR 的密码， 默认为 SYSAUDITOR
    DM_SYSAUDITOR_PWD="DreamSoft_123" \
    # 初始化数据库名字，默认是 DAMENG
    DM_DB_NAME="dreamdb" \
    # 初始化数据库实例名字，默认是 DMSERVER
    DM_INSTANCE_NAME="dreamdbserver" \
    # 初始化时设置 SYSSSO 的密码，默认为 SYSSSO
    DM_SYSSSO_PWD="" \
    # 初始化时设置 SYSDBO 的密码，默认为 SYSDBO
    DM_SYSDBO_PWD="" \
    # 初始化时区
    DM_TIME_ZONE="+08:00" \
    # dm.key 的文件路径，留空则为试用版
    DM_KEY_PATH=""

VOLUME /data

EXPOSE 5236

CMD ["bash", "/run.sh"]

