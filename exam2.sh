#!/bin/bash
#check if you have the mysql
if [`rpm -qa | grep mysql` -ne 0]
then
    echo -e "You have download the mysql!\n"
else
    echo -e "You don't have download the mysql!\n"
    wget https://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.38.tar.gz
    echo -e "I have download the sourcode of mysql!\n"
    #compile the sourcode of mysql
    tar -zxvf mysql-5.6.38.tar.gz -C /usr/local
    groupadd mysql
    useradd -r -g mysql mysql
    cd /usr/local/mysql-5.6.38
    #option of conpile the mysql
    echo -e "compiling..."
    cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
    -DMYSQL_DATADIR=/usr/local/mysql/data \
    -DWITH_INNOBASE_STORAGE_ENGINE=1 \
    -DMYSQL_UNIX_ADDR=/usr/local/mysql/mysql.sock \
    -DMYSQL_UNIX_USER=mysql \
    -DDEFAULT_CHARSET=utf8 \
    -DDEFAULT_COLLATION=utf8_general_ci

    #start the compile
    #multiple kernel to compile

    make  
    make install
    make clean
    
    chown -Rf mysql:mysql /usr/local/mysql
    chown -Rf mysql:mysql /usr/local/mysql/data
    
    cd /usr/local/mysql
    #make a copy
    cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld

    #give the directory to priority
    chmod +x /etc/init.d/mysqld
    chkconfig --add mysqld
    chkconfig mysqld on
    
    #setup the mysql
    scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql\ 
    --datadir=/home/data/mysql/data\
    --defaultdir=/usr/local/mysql/my.cnf
    
    #start the service
    cd /usr/local/mysql/bin
    service mysql start
   
    echo -e "Good Luck!You have installed the mysql"
 
    echo -e "Your password is 123456"
    mysqladmin -u root password 123456 

    #login to mysql used by root   
    mysql -u root -p 123456

    create database if not exists myapp
    show database
fi

