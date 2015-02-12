FROM centos:centos7

MAINTAINER sachit.nep@gmail.com

# add mysql user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN yum -y install epel-release \
 && yum --enablerepo=epel -y install pwgen

RUN yum -y update \
 && yum -y install mariadb-server \
 && rm -rf /var/lib/apt/lists/* 

ADD mysql_install_db.sh /mysql_install_db.sh

ADD create-user.sh /create-user.sh

RUN chmod 775 /*.sh

VOLUME ["/etc/mysql"]

EXPOSE 3306

CMD ["/mysql_install_db.sh"]


