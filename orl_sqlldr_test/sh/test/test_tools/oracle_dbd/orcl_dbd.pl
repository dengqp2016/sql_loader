#!/usr/bin/perl

use DBI;
$sid="ODS";
$user="scott";
$passwd="tiger";
$dbh = DBI->connect("dbi:Oracle:$sid","$user","$passwd") or die "can't connect to database ". DBI-errstr;
#连接数据库
$sth=$dbh->prepare("select * from user_tables");
#$sth=$dbh->prepare("select sysdate from dual");
$sth->execute;
#执行sql语句
while (@recs=$sth->fetchrow_array) {
print $recs[0].":".$recs[1]."\n";
}
$dbh->disconnect;
