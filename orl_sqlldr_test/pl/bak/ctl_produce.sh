while read TABLENAME
do
echo "Get " $TABLENAME " produce:"
perl ctl_produce.pl $TABLENAME
done < table.unl
