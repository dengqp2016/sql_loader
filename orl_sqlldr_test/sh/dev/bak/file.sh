filename=`date +%Y%m%d`
echo $filename
if [ -d $filename ]
then 
	echo $filename "exists"
else
	mkdir $filename
fi
cd $filename
cp ../load/shell/*.sh ./
cp ../load/pl/*.pl ./
cp ../load/unl/*.unl ./

mkdir load 
cd load
mkdir script log data
cd ..
cp ../load/script/*ctl ./load/script
