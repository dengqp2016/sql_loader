newlines=`wc new.unl`
newflag=`echo $newlines|awk -F " " '{print $1}'`
echo $newflag
