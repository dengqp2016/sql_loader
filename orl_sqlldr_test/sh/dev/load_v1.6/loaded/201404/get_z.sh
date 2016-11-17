#/bin/bash

datadir=`pwd | sed 's,^\(.*/\)\?\([^/]*\),\2,'`

line=`cat ftp_conn.unl`
host=`echo $line|awk -F "|" '{print $1}'`
username=`echo $line|awk -F "|" '{print $2}'`
password=`echo $line|awk -F "|" '{print $3}'`
remote_path=`echo $line|awk -F "|" '{print $4}'`

echo $remote_path$datadir

lftp -u $username,$password sftp://$host << EOF
cd $remote_path$datadir
mget dir.*
bye
EOF

ls dir.* > f2.unl

comm -23 f2.unl f1.unl > f.unl

cp f2.unl f1.unl
