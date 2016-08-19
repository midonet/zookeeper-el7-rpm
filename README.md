zookeeper-redhat7-rpm
---------

A set of scripts to package zookeeper for EL.
Requires CentOS/RedHat 7.

Setup
-----
Install build dependencies:

    sudo yum install -y make rpmdevtools wget python-devel gcc autoconf automake libtool cppunit-devel

Building
--------

    make rpm

Resulting RPMs will be avaliable at $(shell pwd)/x86_64

Installing and operating
------------------------
    sudo yum install zookeeper*.rpm
    sudo systemctl start zookeeper
    sudo systemctl enable zookeeper

Default locations
-----------------
data:     /var/lib/zookeeper  
logs:     /var/log/zookeeper  
configs:  /etc/zookeeper, /etc/sysconfig/zookeeper  
