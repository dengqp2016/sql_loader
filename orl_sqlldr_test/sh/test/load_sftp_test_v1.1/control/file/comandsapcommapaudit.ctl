LOAD DATA 
CHARACTERSET UTF8
APPEND INTO TABLE  rmis.comandsapcommapaudit
FIELDS TERMINATED BY '|'
(SYSCOM
,SAPCOMCODE
,COMNAME
,SAPCOMNAME
,CONTENT
,OPERATOR
,MAKEDATE DATE "yyyy-mm-dd hh24:mi:ss"
,MAKETIME
,MODIFYDATE DATE "yyyy-mm-dd hh24:mi:ss"
,MODIFYTIME
)