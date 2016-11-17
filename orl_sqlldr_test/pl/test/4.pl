#!/perl/bin/perl
print "Content-type:text/html\n\n";

#引用格式：“use 模块名”
#use DBI;

#my $dbh = DBI->;connect("dbi:Oracle:ods", 'orcl_sqldr','123456');
#my $sql = qq{ insert into test_load values('99','ccccccc',sysdate)}; 
#my $sth = $dbh->;prepare( $sql );
#$sth->;execute(); 
#$dbh->;disconnect();

print "新记录已生成，请用SQL*Plus重新查询！";
exit;
