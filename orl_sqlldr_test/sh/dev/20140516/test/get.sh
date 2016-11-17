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
cd $datadir
prompt off
mls *.z f2.unl
close
by
!

comm -23 f2.unl f1.unl > f.unl

cat f.unl | while read ConFile
do
sh ./ftp1.sh $ConFile
done
cp f2.unl f1.unl
