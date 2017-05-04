zookeeper-redhat7-rpm
---------

A set of scripts to package zookeeper for EL and SLES.
Requires CentOS/RedHat 7/SLES 12.

Setup
-----
Install build dependencies on RedHat:

    sudo yum install -y make rpmdevtools wget python-devel gcc autoconf automake libtool cppunit-devel

Install build dependencies on SLES:

    sudo zypper install -y make rpmdevtools wget python-devel gcc autoconf automake libtool cppunit-devel

Building
--------
To build RedHat packages:

    make rhel

To build SLES packages:

    make sles

Resulting RPMs will be avaliable at $(shell pwd)/x86_64

Installing and operating
------------------------
    sudo {yum, zypper} install zookeeper*.rpm
    sudo systemctl start zookeeper
    sudo systemctl enable zookeeper

Default locations
-----------------
data:     /var/lib/zookeeper  
logs:     /var/log/zookeeper  
configs:  /etc/zookeeper, /etc/sysconfig/zookeeper  
