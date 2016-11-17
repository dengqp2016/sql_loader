while read DIR_Z_NAME
do
echo "Run" $DIR_Z_NAME "load sql:"
perl run_sqlldr.pl $DIR_Z_NAME
done < dir_z.unl
