LOAD DATA 
CHARACTERSET ZHS16GBK
APPEND INTO TABLE  rmis.temp_test_load
FIELDS TERMINATED BY '|'
(ID
,UNAME
,PHONE
,TX_DATA DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)