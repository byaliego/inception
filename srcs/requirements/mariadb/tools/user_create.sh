#!/bin/bash

service mysql start         # start mysql service

# create database with DB_NAME
mysql -u root -e "CREATE DATABASE ${DB_NAME};"

# create user with DB_USER and DB_PASSWORD
mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# grant all privileges on DB_NAME to DB_USER
mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"

# flush privileges in order to apply changes
mysql -u root -e "FLUSH PRIVILEGES;"

# change root password. For my case it is yogun42
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"