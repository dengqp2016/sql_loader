LOAD DATA 
CHARACTERSET UTF8
APPEND INTO TABLE  mid.crm_pol_rltn
FIELDS TERMINATED BY '|'
(CONTNO
,CUSTOMERNO
,AGENTCODE
,BRANCHTYPE
,BRANCHTYPE2
,MODIFYDATE DATE "yyyy-mm-dd hh24:mi:ss"
,UPD_DT FILLER DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)
