#! /bin/bash

# mysql_install_db initializes the MariaDB data directory and creates the system tables in the mysql database, if they do not exist.
mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

/etc/init.d/mariadb setup;
rc-service mariadb start;
rc-service telegraf start;

# Create Database in MySQL
mysql -u root -e "CREATE DATABASE wp_db"
mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin'"
mysql -u root -e  "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%'"
mysql -u root -e "FLUSH PRIVILEGES;";
mysql -u root -e "CREATE DATABASE phpmyadmin"

# Import MySQL Database
mysql -u root  wp_db < wp_db.sql
mysql -u root phpmyadmin < phpmyadmin.sql

# Start  Telegraf 
telegraf --config /etc/telegraf/telegraf.conf
sleep infinity