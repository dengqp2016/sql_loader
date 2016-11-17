while true
do
flag=`cat ./run.unl`
echo $flag
if [ $flag == 'on' ]
then 
	echo "loading at : " `date +%Y%m%d' '%H:%M:%S` >> run.out
	
	filename1=`date +%Y%m%d`
	filename2=`date -d "1 day ago" +%Y%m%d`
	sh ./load.sh $filename1
	sh ./load.sh $filename2
	sleep 60
else
	break
fi
done
