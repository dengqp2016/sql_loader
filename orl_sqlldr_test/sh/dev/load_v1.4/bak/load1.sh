if [ ! -d loaded ]
then 
	mkdir loaded
fi
cd loaded

filename=`date +%Y%m%d`
echo $filename
if [ -d $filename ]
then 
	echo $filename "exists"
	cd $filename
else
	mkdir $filename
	cd $filename
	touch f1.unl
	cp ../../script/shell/*.sh ./
	cp ../../script/pl/run_sqlldr.pl ./
	cp ../../config_file/*_conn.unl ./

	mkdir load 
	cd load
	mkdir script log data
	cd ..
	cp ../../control/file/*.ctl ./load/script
pwd
fi

