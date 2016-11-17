cat dir_z.unl | while read line
do
cat $line | while read line1
do 
filename_data=`echo $line1|awk -F " " '{print $1}'`
echo $filename_data
ftp -n <<!

open 10.8.24.98
user View dengqingpu1992!
cd send/crm
cd 20140516
get $filename_data
bye
!
done
done
