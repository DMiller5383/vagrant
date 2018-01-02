#!/bin/bash

#update CentOS with any patches
yum update -y --exclude=kernel

#Tools
yum install -y nano git unzip screen wget

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd-devel
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

#php
yum install -y php php-cli php-common php-devel php-mysql

#MySQL
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update -y
yum install -y mysql-server
#chkconfig --add mysqld
#chkconfig mysqld on
systemctl start mysqld


mysql -u root -e "SHOW DATABASES";

#DOWNLOAD started content
cd ~/sites/vagrant-test
sudo -u vagrant wget -q https://raw.githubusercontent.com/DMiller5383/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/DMiller5383/vagrant/master/files/info.php
service httpd restart
setenforce 0
