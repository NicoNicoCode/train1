一键源码安装MySQL的脚本
=======================
<br/>
1.检测是否安装MySQL
--------------------
    　　#检查是否安装MySQL
    　　#!/bin/bash
    　if [\`rpm -qa | grep mysql` -ne 0]
    　then
    　　  echo -e "You have download the mysql!\n"
    　else
    　　  echo -e "You don't have download the mysql!\n"
2.安装MySQL
-----------
        #下载MySQL源码
    　　wget https://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.38.tar.gz
    　　echo -e "You have download the sourcode of mysql!\n"
    　　#开始编译MySQL
    　　tar -zxvf mysql-5.6.38.tar.gz -C /usr/local
    　　#添加mysql用户和组
    　　groupadd mysql
    　　useradd -r -g mysql mysql
    　　cd /usr/local/mysql-5.6.38
3.开始编译源码
--------------
        echo -e "compiling..."
    　　#预编译MySQL选项
    　　cmake \
    　　-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
    　　-DMYSQL_DATADIR=/usr/local/mysql/data \
    　　-DWITH_INNOBASE_STORAGE_ENGINE=1 \
    　　-DMYSQL_UNIX_ADDR=/usr/local/mysql/mysql.sock \
    　　-DMYSQL_UNIX_USER=mysql \
    　　-DDEFAULT_CHARSET=utf8 \
    　　-DDEFAULT_COLLATION=utf8_general_ci
    　　#开始编译
    　　make  
    　　make install
    　　make clean
    　　#赋予MySQL用户和组的基本权限
    　　chown -Rf mysql:mysql /usr/local/mysql
    　　chown -Rf mysql:mysql /usr/local/mysql/data
    　　cd /usr/local/mysql
    　　#复制启动文件到 /etc中
    　　cp /usr/local/mysql/support-files/mysql.server 　　/etc/init.d/mysqld
    　　#修改文件权限
    　　chmod +x /etc/init.d/mysqld
    　　chkconfig --add mysqld
    　　chkconfig mysqld on
    　　#初始化MySQL
    　　scripts/mysql_install_db --user=mysql 　　　　--basedir=/usr/local/mysql\ 
    　　--datadir=/home/data/mysql/data\
    　　--defaultdir=/usr/local/mysql/my.cnf
    　　#开启MySQL服务
    　　cd /usr/local/mysql/bin
    　　service mysql start
    　　#打印“安装成功的信息”
    　　echo -e "Good Luck!You have installed the mysql"
    　　#修改密码
    　　echo -e "Your password is 123456"
    　　mysqladmin -u root password 123456 
    　　#登陆MySQL  
    　　mysql -u root -p 123456
    　　#创建数据库并显示
    　　create database if not exists myapp
    　　show database
      fi


