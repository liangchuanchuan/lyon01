#!/bin/bash
## 每5s检测一次磁盘io，当发现问题去查询mysql的processlist。
##你可以用iostat -x 1  5 来判定磁盘的io，主要看%util

n=`iostat  -x   1 2 | tail -n3 | tail -n2 |awk '{print $NF}' | cut -d . -f 1`
if [ $n==0 ]
 then 
     echo "the disk io is too hign"
     echo "`date` util% is $n" >> /tmp/mysql_processlist.txt
     mysql -uroot -p123 -e "show full  processlist" >> /tmp/mysql_processlist.txt
fi
 sleep 5 
