LOAD DATA 
CHARACTERSET UTF8
APPEND INTO TABLE  mid.crm_payment_clct_d
FIELDS TERMINATED BY '|'
(CONTNO
,PAYFLAG
,PAYDATE DATE "yyyy-mm-dd hh24:mi:ss" "replace(:PAYDATE,'0001-01-01',null)"
,PAYSUCCFLAG
,AGENTCHANGE
,STARTPAYYM
,STARTPAYDATE
,MANAGECOM
,AGENTGROUP
,AGENTCODE
,BRANCHTYPE
,BRANCHTYPE2
,MODIFYDATE DATE "yyyy-mm-dd hh24:mi:ss" "replace(:MODIFYDATE,'0001-01-01',null)"
,UPD_DT FILLER DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)
