username=orcl_sqldr
password=123456
id=ods
sqlplus -s ${username}/${password}@$id <<EOF
select to_char(sysdate,'YYYY-MM-DD')from dual;
EOF
