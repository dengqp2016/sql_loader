filename=`date +%Y%m%d`
echo $filename
if [ -d $filename ]
then 
	echo $filename "exists"
	cd $filename
else
	mkdir $filename
	cd $filename
	cp ../load/shell/*.sh ./
	cp ../load/pl/*.pl ./
	cp ../load/unl/*.unl ./

	mkdir load 
	cd load
	mkdir script log data
	cd ..
	cp ../load/script/*ctl ./load/script
fi

sh ./get_z.sh
sh ./get_data.sh
sh ./run_sqlldr.sh
