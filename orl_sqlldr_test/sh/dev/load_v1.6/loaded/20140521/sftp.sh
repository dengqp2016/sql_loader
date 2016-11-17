host=10.1.160.3
user=rmis
password=1111
remote_path=/send/rmis/201404
lftp -u $user,$password sftp://$host << EOF
cd $remote_path
ls | grep dir.* > aa.cc
bye
EOF
