LOAD DATA 
APPEND INTO TABLE  rmis.rmis_indmn_pay
FIELDS TERMINATED BY '|'
(D_DATE DATE "yyyy-mm-dd hh24:mi:ss"
,SCODE
,SNAME
,TCODE
,TNAME
,THCODE
,THNAME
,RISKCODE
,RISKNAME
,SALECHNL
,STANDPAY
,TIMESTAMP_TD
)
