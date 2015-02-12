#!/bin/bash

/usr/bin/mysqld_safe --skip-grant > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done


PASS=${MARIADB_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${MARIADB_PASS} ] && echo "preset" || echo "random" )
echo "Creating MariaDB admin user with ${_word} password"

mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"

echo "========================================================================"
echo "You can now connect to Mariadb server using."
echo ""
echo "    mysql -uadmin -p$PASS -h<host> -P<port>"
echo ""
echo "========================================================================"

mysqladmin -uroot shutdown

