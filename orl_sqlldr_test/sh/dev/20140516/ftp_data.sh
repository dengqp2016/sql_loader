#/bin/bash

datadir=`date +%Y%m%d`

line=`cat ftp.unl`
ftpip=`echo $line|awk -F "|" '{print $1}'`
username=`echo $line|awk -F "|" '{print $2}'`
password=`echo $line|awk -F "|" '{print $3}'`

ftp -n << !
open $ftpip
user $username $password
cd ./send/crm
lcd ./load/data
cd $datadir
bin
get $1
by
!

