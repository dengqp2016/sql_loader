LOAD DATA 
CHARACTERSET UTF8
APPEND INTO TABLE  mid.crm_new_pol_unsign
FIELDS TERMINATED BY '|'
(DATA FILLER DATE "yyyy-mm-dd hh24:mi:ss"
,PRTNO
,SIGNSTATE
,SIGNDATE DATE "yyyy-mm-dd hh24:mi:ss" "replace(:SIGNDATE,'0001-01-01',null)"
,ERRINFO
,MAKEDATE
,MODIFYDATE
,UPD_DT FILLER DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)
