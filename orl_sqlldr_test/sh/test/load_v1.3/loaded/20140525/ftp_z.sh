#/bin/bash

datadir=`pwd | sed 's,^\(.*/\)\?\([^/]*\),\2,'`

line=`cat ftp_conn.unl`
ftpip=`echo $line|awk -F "|" '{print $1}'`
username=`echo $line|awk -F "|" '{print $2}'`
password=`echo $line|awk -F "|" '{print $3}'`
remote_path=`echo $line|awk -F "|" '{print $4}'`

ftp -n << !
open $ftpip
user $username $password
cd $remote_path$datadir
bin
get $1
by
!

