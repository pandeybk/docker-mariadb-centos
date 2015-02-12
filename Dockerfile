FROM centos:centos7

MAINTAINER sachit.nep@gmail.com

# add mysql user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN yum -y update \
 && yum -y install mariadb-server \
 && rm -rf /var/lib/apt/lists/* 

ADD mysql_install_db.sh /mysql_install_db.sh

RUN chmod 775 /mysql_install_db.sh

VOLUME ["/etc/mysql"]

EXPOSE 3306

CMD ["/mysql_install_db.sh"]


