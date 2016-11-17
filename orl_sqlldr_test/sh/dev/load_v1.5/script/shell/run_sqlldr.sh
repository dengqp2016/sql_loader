LOADHOME=`pwd`
echo $LOADHOME

line=`cat ./db_conn.unl`
DBUSER=`echo $line|awk -F "|" '{print $1}'`
PASSWORD=`echo $line|awk -F "|" '{print $2}'`
DSN=`echo $line|awk -F "|" '{print $3}'`

while read DIR_Z_NAME
do
echo "Run" $DIR_Z_NAME "load sql:"
perl run_sqlldr.pl $DIR_Z_NAME $LOADHOME $DBUSER $PASSWORD $DSN
done < f.unl
