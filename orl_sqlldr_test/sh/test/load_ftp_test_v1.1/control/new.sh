if [ ! -f ctl_produce.pl ]
then 
	echo "get ctl_produce.pl from ../script/pl:"
	cp ../script/pl/ctl_produce.pl ./
fi

if [ -d file ]
then 
	echo -e "file exists\n"
else 
	mkdir file
fi

if [ -f new.unl ]
then 
	echo -e "new.unl exists!\n"
	grep -vxFf old.unl ../config_file/table.unl > new.unl
	cp ../config_file/table.unl old.unl
else
	echo -e "new.unl not found!\n"
	cp ../config_file/table.unl old.unl
	cp old.unl new.unl
fi

newlines=`wc new.unl`
newflag=`echo $newlines|awk -F " " '{print $1}'`
echo $newflag

if [ $newflag -eq 0 ]
then
	echo -e "No new table control need to create!\n"
else

HOME=`pwd`
echo $HOME

line=`cat ../config_file/db_conn.unl`
DBUSER=`echo $line|awk -F "|" '{print $1}'`
PASSWORD=`echo $line|awk -F "|" '{print $2}'`
DSN=`echo $line|awk -F "|" '{print $3}'`

while read TABLENAME
do
echo -e "\nGet " $TABLENAME " produce:"
perl ctl_produce.pl $TABLENAME $HOME $DBUSER $PASSWORD $DSN
done < new.unl

fi
