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
#addStr1=`echo $line|awk -F "." '{print $4}'`
#addStr2=`echo $line|awk -F "." '{print $5}'`
#echo $addStr1-$addStr2
sed -i "s/$/|$data_filename/" ./load/data/$data_filename
done
done
