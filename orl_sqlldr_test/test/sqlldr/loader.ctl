load data 
infile './datafile.txt' 
into table test_load 
fields terminated by "," optionally enclosed by '"' 
( id, uname, phone )
