#! /bin/bash
#  busybox-extras telnet localhost 3306
# mysql_install_db initializes the MariaDB data directory and creates the system tables in the mysql database, if they do not exist.
# https://mariadb.com/kb/en/mysql_install_db/
# dev/null is a special file that acts as a black hole
# Together they mean "throw away any error messages"

mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
/etc/init.d/mariadb setup;

rc-status;
rc-service mariadb start;
rc-service telegraf start;

# Create Database in MySQL
mysql -u root -e "CREATE DATABASE wp_db"
mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin'"
mysql -u root -e  "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%'"
mysql -u root -e "FLUSH PRIVILEGES;";
# /etc/init.d/mariadb setup;
# Export MySQL Database
# mysql -uUSERNAME -p DB_NAME < import_file.sql
mysql -u root  wp_db < wp_db.sql
mysql -u root -e "CREATE DATABASE phpmyadmin"
mysql -u root phpmyadmin < phpmyadmin.sql
telegraf --config /etc/telegraf/telegraf.conf
sleep infinity