#!/usr/bin/perl

use DBI;
$sid="ODS";
$user="ORCL_SQLDR";
$passwd="123456";
$dbh = DBI->connect("dbi:Oracle:$sid","$user","$passwd") or die "can't connect to database ". DBI-errstr;
#�������ݿ�
$sth=$dbh->prepare("select * from user_tables");
#$sth=$dbh->prepare("select sysdate from dual");
$sth->execute;
#ִ��sql���
while (@recs=$sth->fetchrow_array) {
print $recs[0].":".$recs[1]."\n";
}
$dbh->disconnect;
