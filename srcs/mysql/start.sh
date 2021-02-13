#! /bin/bash

# mysql_install_db initializes the MariaDB data directory and creates the system tables in the mysql database, if they do not exist.
# https://mariadb.com/kb/en/mysql_install_db/


# dev/null is a special file that acts as a black hole
# Together they mean "throw away any error messages"
mysql_install_db -u root --datadir=/var/lib/mysql > /dev/null
# Create Database in MySQL
mysql -u root -e "CREATE DATABASE wp_db"
mysql -u root -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin'"
mysql -u root -e  "GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost'"

# Export MySQL Database
# mysql -uUSERNAME -p DB_NAME < import_file.sql
mysql -uroot -p wp_db < wp_db.sql
