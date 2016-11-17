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

