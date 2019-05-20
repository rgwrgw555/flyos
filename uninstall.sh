#!/usr/bin/env bash

basedir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
cd $basedir

sed -i '/zh_CN.UTF-8/d' /etc/profile
sed -i '/export PATH/d' /etc/profile
sed -i '/export JAVA_HOME/d' /etc/profile
sed -i '/export CLASSPATH/d' /etc/profile
sed -i '/export LD_LIBRARY_PATH/d' /etc/profile

sed -i '/INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT/d' /etc/sysconfig/iptables
sed -i '/INPUT -p tcp -m state --state NEW -m tcp --dport 8000/d' /etc/sysconfig/iptables
sed -i '/INPUT -p tcp -m state --state NEW -m tcp --dport 3306 -j ACCEPT/d' /etc/sysconfig/iptables
sed -i '/INPUT -p tcp -m state --state NEW -m tcp --dport 5672 -j ACCEPT/d' /etc/sysconfig/iptables
sed -i '/INPUT -p tcp -m state --state NEW -m tcp --dport 8080 -j ACCEPT/d' /etc/sysconfig/iptables
sed -i '/INPUT -p tcp -m state --state NEW -m tcp --dport 5005 -j ACCEPT/d' /etc/sysconfig/iptables
sed -i '/INPUT -p tcp -m state --state NEW -m tcp --dport 8090 -j ACCEPT/d' /etc/sysconfig/iptables
sed -i '/INPUT -p tcp -m state --state NEW -m tcp --dport 8899 -j ACCEPT/d' /etc/sysconfig/iptables
sed -i '/INPUT -p tcp -m state --state NEW -m tcp --dport 8070 -j ACCEPT/d' /etc/sysconfig/iptables

sed -i '/frpc.sh/d' /etc/rc.d/rc.local
sed -i '/start.sh/d' /etc/rc.d/rc.local
sed -i '/nginx/d' /etc/rc.d/rc.local

sed -i '/bak.sh/d' /etc/crontab
sed -i '/restart.sh/d' /etc/crontab
