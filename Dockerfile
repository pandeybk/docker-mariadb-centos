FROM centos:centos7

MAINTAINER sachit.nep@gmail.com

# add mysql user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN yum -y update && yum install -y perl && rm -rf /var/lib/apt/lists/*

RUN yum update \
 && yum -y install mariadb-server mariadb mariadb-devel \
 && rm -rf /var/lib/mysql \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /var/lib/mysql

VOLUME ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306

CMD ["mysqld_safe"]


