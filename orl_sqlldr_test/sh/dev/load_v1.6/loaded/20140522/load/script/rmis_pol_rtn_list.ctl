LOAD DATA 
APPEND INTO TABLE  rmis.rmis_pol_rtn_list
FIELDS TERMINATED BY '|'
(CONTNO
,APPNTNAME
,APPAGE
,SEX
,INSUREDNAME
,INSUREDAPPAGE
,INSUREDSEX
,RISKCODE
,RISKNAME
,SUMPREM
,REMARK
,PAYTERM
,POLAPPLYDATE DATE "yyyy-mm-dd hh24:mi:ss"
,SURNAME
,CVALIDATE DATE "yyyy-mm-dd hh24:mi:ss"
,MAKEDATE DATE "yyyy-mm-dd hh24:mi:ss"
,USERNAME
,PAYCOUNT
,PAYTODATE DATE "yyyy-mm-dd hh24:mi:ss"
,AGENTCODE
,NAME_TD
,AGENTCOM
,MANAGECOM
,SERVERFLAG
,SCODE
,SNAME
,TCODE
,TNAME
,SALECHNL
,EDORACCEPTNO
,EDORAPPDATE DATE "yyyy-mm-dd hh24:mi:ss"
,GETMONEY_PLAN
,GETMONEY_SCT
,DIFFERENCE
,CONFDATE DATE "yyyy-mm-dd hh24:mi:ss"
,TIMESTAMP_TD
)
