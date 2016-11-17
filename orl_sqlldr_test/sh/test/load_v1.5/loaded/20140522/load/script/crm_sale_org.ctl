LOAD DATA 
CHARACTERSET ZHS16GBK
APPEND INTO TABLE  rmis.crm_sale_org
FIELDS TERMINATED BY '|'
(DATA_DT DATE "yyyy-mm-dd hh24:mi:ss"
,ORG_CD
,ORG_NAME
,MGT_ORG_CD
,CRT_DATE DATE "yyyy-mm-dd hh24:mi:ss"
,CLOSE_DATE DATE "yyyy-mm-dd hh24:mi:ss"
,SUPR_ORG_CD
,LAST_MDF_DATE DATE "yyyy-mm-dd hh24:mi:ss"
,CHNL_IND
,SBJ_CHNL_IND
,UPD_DT DATE "yyyy-mm-dd hh24:mi:ss"
,BATCHNO
)
