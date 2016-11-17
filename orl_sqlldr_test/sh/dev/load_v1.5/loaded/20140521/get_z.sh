#/bin/bash

line=`cat ftp_conn.unl`
host=`echo $line|awk -F "|" '{print $1}'`
username=`echo $line|awk -F "|" '{print $2}'`
password=`echo $line|awk -F "|" '{print $3}'`
remote_path=`echo $line|awk -F "|" '{print $4}'`

lftp -u $username,$password sftp://$host << EOF
cd $remote_path
mget dir.*
bye
EOF

ls dir.* > f2.unl

comm -23 f2.unl f1.unl > f.unl

cp f2.unl f1.unl
