#! /bin/bash
# 

mysqldump="/usr/local/mysql/bin/mysqldump"
bakuser="lyon"
passwd="123"
bakdir="/data/backup"
d1=`date +%F`
d2=`date +%d`

echo "mysql backup begin at `date`"

for discuz  in  discuz 
do 
   $mysqldump -u$bakuser -p$passwd $db > $bakdir/$discuz-$d1.sql 
done 


