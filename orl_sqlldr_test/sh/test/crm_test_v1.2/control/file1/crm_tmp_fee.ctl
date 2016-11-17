LOAD DATA 
CHARACTERSET UTF8
APPEND INTO TABLE  mid.crm_tmp_fee
FIELDS TERMINATED BY '|'
(SJRQ
,TEMPFEENO
,PRTNO
,RISKCODE
,STANDPREM
,PAYMONEY
,PAYDATE "replace(:PAYDATE,'0001-01-01',null)"
,ENTERACCDATE "replace(:ENTERACCDATE,'0001-01-01',null)"
,AGENTCODE
,AGENTGROUP
,ACCNAME
,IDTYPE
,IDNO
,MANAGECOM
,CHANNEL
,PAYINTV
,BRANCHTYPE2
,UPD_DT FILLER DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)
