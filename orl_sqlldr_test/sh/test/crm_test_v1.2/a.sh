a=1
b=2
c=`expr $a + d`
echo $c
#sed "$a,{$b}d" run.sh > aa.xml
echo "$a,{$b}d"
