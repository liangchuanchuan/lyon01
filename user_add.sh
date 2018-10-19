#! /bin/bash

# 检查是否有mkpasswd命令，没有则安装

if !   which  mkpasswd &> /dev/null
then 
   echo "没有mkpasswd命令，请安装"
   yum install -y expect
fi 

#判断是否有 /data/user_passwd
#若存在，先删掉

[ -f /data/user_passwd ] && rm -rf /data/user_passwd

for n in `seq -w  1 5`
do 
 pass=`mkpasswd`
 echo "添加用户 user_$n"
 useradd -g users user_$n 
 echo "给用户 user_$n 设置密码"
 echo "user_$n $pass" >> /data/user_passwd
done


