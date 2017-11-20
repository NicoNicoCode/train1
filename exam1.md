虚拟机网络配置
===========

1.配置静态IP
-----------
	  使用“ip addr”显示出网卡名称  
     
      [root@localhost ~]# ip addr
      1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
        valid_lft forever preferred_lft forever
      inet6 ::1/128 scope host 
        valid_lft forever preferred_lft forever
      2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
      link/ether 00:1a:4a:18:00:89 brd ff:ff:ff:ff:ff:ff
      inet 192.168.255.253/16 brd 192.168.255.255 scope global eth0
        valid_lft forever preferred_lft forever
      inet6 fe80::a283:8b44:c17:7b9/64 scope link tentative dadfailed 
        valid_lft forever preferred_lft forever
      inet6 fe80::b6fe:3a95:6f90:9897/64 scope link tentative dadfailed 
        valid_lft forever preferred_lft forever
      inet6 fe80::b297:5013:8783:ede2/64 scope link tentative dadfailed 
        valid_lft forever preferred_lft forever
        
	  修改eth0文件
      vi /etc/sysconfig/network-scripts/ifcfg-eth0
      TYPE="Ethernet"
      BOOTPROTO="none"
      DEFROUTE="yes"
      IPV4_FAILURE_FATAL="no"
      IPV6INIT="yes"
      IPV6_AUTOCONF="yes"
      IPV6_DEFROUTE="yes"
      IPV6_FAILURE_FATAL="no"
      IPV6_ADDR_GEN_MODE="stable-privacy"
      NAME="eth0"
      UUID="150fc126-a19c-4f82-ae5b-9fa118374f27"
      DEVICE="eth0"
      ONBOOT="yes"
      IPADDR="192.168.255.253"
      PREFIX="16"
      GATEWAY="192.168.0.1"
      DNS1="114.114.114.114"
      IPV6_PEERDNS="yes"
      IPV6_PEERROUTES="yes"
      IPV6_PRIVACY="no"
      ~
      "/etc/sysconfig/network-scripts/ifcfg-eth0" 20L, 411C
      
      键盘输入"i"进入插入模式,修改两项
      BOOTPROTO="static"
      IPADDR="192.168.34.60"
      键盘按Esc键回到观察模式，再输入":wq"进行保存
      
      输入“service network restart”
      [root@localhost ~]# service network restart
	  Restarting network (via systemctl):                        [  OK  ]
      
      再次查看IP
      
    [root@localhost ~]# ip addr
     1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
     inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
     inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
     2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
     link/ether 00:1a:4a:18:00:89 brd ff:ff:ff:ff:ff:ff
     inet 192.168.34.60/16 brd 192.168.255.255 scope global eth0
       valid_lft forever preferred_lft forever
     inet6 fe80::a283:8b44:c17:7b9/64 scope link tentative dadfailed 
       valid_lft forever preferred_lft forever
     inet6 fe80::b6fe:3a95:6f90:9897/64 scope link tentative dadfailed 
       valid_lft forever preferred_lft forever
     inet6 fe80::b297:5013:8783:ede2/64 scope link tentative dadfailed 
       valid_lft forever preferred_lft forever
      
      
  2.ssh配置
  ------------
  		因为oVrit所给的虚拟机自带sshd服务，因此略
  
      


