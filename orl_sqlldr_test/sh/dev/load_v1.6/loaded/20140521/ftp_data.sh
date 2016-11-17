#/bin/bash

line=`cat ftp_conn.unl`
host=`echo $line|awk -F "|" '{print $1}'`
username=`echo $line|awk -F "|" '{print $2}'`
password=`echo $line|awk -F "|" '{print $3}'`
remote_path=`echo $line|awk -F "|" '{print $4}'`

lftp -u $username,$password sftp://$host << EOF
cd $remote_path
lcd ./load/data
get $1
bye
EOF

