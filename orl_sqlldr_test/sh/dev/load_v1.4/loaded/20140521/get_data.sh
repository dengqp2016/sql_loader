cat f.unl | while read line
do
echo $line
cat $line | while read ConFileLine
do 
echo $ConFileLine
data_filename=`echo $ConFileLine|awk -F " " '{print $1}'`
echo $data_filename
sh ./ftp_data.sh $data_filename.gz 
gunzip ./load/data/$data_filename.gz
done
done
