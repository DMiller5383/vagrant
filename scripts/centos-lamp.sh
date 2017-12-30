#!/bin/bash

#update CentOS with any patches
yum update -y --exclude=kernel

#Tools
yum install -y nano git unzip screen

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd-devel
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s ~/sites/vagrant-test /var/www/html

service httpd start

#php
yum install -y php php-cli php-common php-devel php-mysql

#MySQL
MySql -y mysql myql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

#DOWNLOAD started content

service httpd restart
