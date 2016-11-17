if [ -d load ]
then 
	echo "load exists"
else 
	mkdir load
fi
cd load

if [ -d script ]
then 
	echo "script exists"
else 
	mkdir script
fi
cd ..

HOME=`pwd`
echo $HOME

while read TABLENAME
do
echo "Get " $TABLENAME " produce:"
perl ctl_produce.pl $TABLENAME $HOME
done < table.unl
