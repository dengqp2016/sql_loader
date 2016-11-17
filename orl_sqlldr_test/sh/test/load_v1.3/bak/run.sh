while true
do
#sh ./load.sh
echo "aaa" >> a.out
flag=`cat ./run.unl`
echo $flag
if [ $flag == 'on' ]
then 
	sleep 10
else
	break
fi
done
