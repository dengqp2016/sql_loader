LOAD DATA 
CHARACTERSET UTF8
APPEND INTO TABLE  mid.crm_pol_rcpt
FIELDS TERMINATED BY '|'
(SJRQ
,POLNO
,PRTNO
,APPNTNAME
,INSUREDNAME
,AGENTCODE
,AGENTGROUP
,AGENTCOM
,POLAPPLYDATE DATE "yyyy-mm-dd hh24:mi:ss" "replace(:POLAPPLYDATE,'0001-01-01',null)"
,CVALIDATE DATE "yyyy-mm-dd hh24:mi:ss" "replace(:CVALIDATE,'0001-01-01',null)"
,SIGNDATE DATE "yyyy-mm-dd hh24:mi:ss" "replace(:SIGNDATE,'0001-01-01',null)"
,CUSTOMGETPOLDATE "replace(:CUSTOMGETPOLDATE,'0001-01-01',null)"
,GETPOLDATE "replace(:GETPOLDATE,'0001-01-01',null)"
,CHANNEL
,MODIFYDATE DATE "yyyy-mm-dd hh24:mi:ss"
,MANAGECOM
,PAYINTV
,BRANCHTYPE2
,UPD_DT FILLER DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)
