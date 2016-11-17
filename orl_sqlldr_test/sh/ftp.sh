cd file
ip=10.8.24.98
user=View
pass=dengqingpu1992!
ftp -n << !
open $ip
user $user  $pass
#binary
cd send/crm
cd 20140516
prompt
#bin
#mget *.log ./file
mget *.z
bye
!
cd ..
