LOAD DATA 
APPEND INTO TABLE  rmis.rmis_death_dss_pay
FIELDS TERMINATED BY '|'
(D_DATE DATE "yyyy-mm-dd hh24:mi:ss"
,SEC_COM
,SEC_COM_NAME
,THD_COM
,THD_COM_NAME
,FTH_COM
,FTH_COM_NAME
,RISKCODE
,RISKNAME
,SALECHNL
,REALPAY_DIE
,REALPAY_DISEASE
,TIMESTAMP_TD
)
