LOAD DATA 
CHARACTERSET UTF8
APPEND INTO TABLE  mid.crm_brdy_info
FIELDS TERMINATED BY '|'
(CUSTOMERNO
,CUSTOMERNAME
,BIRTHDAY DATE "yyyy-mm-dd hh24:mi:ss"
,ROLE
,RELATIONTOAPPNT
,RELATIONTOAPPNTNAME
,CONTNO
,UPD_DT FILLER DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)
