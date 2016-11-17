#/bin/bash

#datadir=`pwd | sed 's,^\(.*/\)\?\([^/]*\),\2,'`

line=`cat ftp_conn.unl`
host=`echo $line|awk -F "|" '{print $1}'`
username=`echo $line|awk -F "|" '{print $2}'`
password=`echo $line|awk -F "|" '{print $3}'`
remote_path=`echo $line|awk -F "|" '{print $4}'`

lftp -u $username,$password sftp://$host << EOF
cd $remote_path$1
pwd > ls.out
bye
EOF

