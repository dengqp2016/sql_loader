LOAD DATA 
CHARACTERSET UTF8
APPEND INTO TABLE  mid.crm_endor_mission
FIELDS TERMINATED BY '|'
(SJRQ
,CONTNO
,EDORACCEPTNO
,APPNTNAME
,INSUREDNAME
,RISKCODE
,GETMONEY
,APPROVEDATE "replace(:APPROVEDATE,'0001-01-01',null)"
,DEFAULTOPERATOR
,APPROVEOPERATOR
,SALECHNL
,BRANCHTYPE2
,UPD_DT FILLER DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)