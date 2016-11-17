load data 
infile test_load.txt
append into table test_load 
fields terminated by "," optionally enclosed by '"' 
( id, uname, phone )
