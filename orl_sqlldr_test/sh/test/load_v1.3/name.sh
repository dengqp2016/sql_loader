filename=$1
echo $filename
filename2=`date -d "1 day ago" +%Y%m%d`
echo $filename2
aaa=`pwd | sed 's,^\(.*/\)\?\([^/]*\),\2,'`
echo $aaa
