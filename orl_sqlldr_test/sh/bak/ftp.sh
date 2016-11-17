cd file
ip=10.1.166.2
user=nclods
pass=nclods635
ftp -n << !
open $ip
user $user  $pass
#binary
cd /
prompt
#bin
mget *.log ./file
bye
!
cd ..
