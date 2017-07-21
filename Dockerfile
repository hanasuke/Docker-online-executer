FROM centos

LABEL maintainer='naosuke <naosuke@live.jp>'

RUN /bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN yum install -y gcc
