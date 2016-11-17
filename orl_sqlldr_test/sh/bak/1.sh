rm tab1.unl
while read LINE
do
A=$LINE
echo $A | rev | cut -d . -f 5 | rev >> tab1.unl
done < 1.unl
