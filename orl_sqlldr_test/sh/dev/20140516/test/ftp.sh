cd file
ip=10.8.24.98
user=View
pass=dengqingpu1992!
ftp -in << !
open $ip
user $user  $pass
#binary
cd send/crm
cd 20140519
#prompt
#bin
#mget *.log ./file
#mget *.z
#prompt off
nlist *.z b.out

bye
!
cd ..
pwd 
