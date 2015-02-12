#!/bin/bash

VOLUME_HOME="/usr/include/mysql"

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    mysql_install_db --user=mysql -ldata=$VOLUME_HOME > /dev/null 2>&1
    /create_user.sh
fi

exec mysqld_safe --skip-grant
