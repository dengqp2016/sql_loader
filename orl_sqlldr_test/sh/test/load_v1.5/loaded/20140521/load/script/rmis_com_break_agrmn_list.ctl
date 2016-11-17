LOAD DATA 
APPEND INTO TABLE  rmis.rmis_com_break_agrmn_list
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
,AMNT
,GETMONEY_ACT
,GETMONEY_PLAN
,DIFFERENCE
,PAYTERM
,POLAPPLYDATE DATE "yyyy-mm-dd hh24:mi:ss"
,CODENAME
,CVALIDATE DATE "yyyy-mm-dd hh24:mi:ss"
,MAKEDATE DATE "yyyy-mm-dd hh24:mi:ss"
,USERNAME
,PAYCOUNT
,PAYTODATE DATE "yyyy-mm-dd hh24:mi:ss"
,AGENTCODE
,NAME_TD
,AGENTGROUP
,BANKCODE
,BANKNODE
,OPERATORCODE
,OPERATORNAME
,BRANCHCODE
,PHONEAGENTCODE
,PHONEAGENTNAME
,SERVERFLAG
,SCODE
,SNAME
,TCODE
,TNAME
,SALECHNL
,EDORACCEPTNO
,EDORAPPDATE DATE "yyyy-mm-dd hh24:mi:ss"
,SURECANCELLATIONDATE DATE "yyyy-mm-dd hh24:mi:ss"
,TIMESTAMP_TD
)