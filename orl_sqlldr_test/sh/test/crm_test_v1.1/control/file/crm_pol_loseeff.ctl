LOAD DATA 
CHARACTERSET UTF8
APPEND INTO TABLE  mid.crm_pol_loseeff
FIELDS TERMINATED BY '|'
(CONTNO
,PAYTODATE
,STARTDATE DATE "yyyy-mm-dd hh24:mi:ss"
,PAYFLAG
,STATEREASON
,AGENTCHANGE
,MANAGECOM
,AGENTGROUP
,AGENTCODE
,BRANCHTYPE
,BRANCHTYPE2
,MODIFYDATE DATE "yyyy-mm-dd hh24:mi:ss"
,UPD_DT FILLER DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)