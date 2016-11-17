#!/usr/bin/perl
#perl script used to connect to Oracle
use strict;
use DBI;


my @row ;
my $tnsname="ODS";
my $username="ORCL_SQLDR";
my $password="123456";


my $dbh=DBI->connect("dbi:Oracle:$tnsname", $username, $password) or die "Cannot conenct db: $DBI::errstr\n";
print "I have connected to the Oracle database!\n";
my $sth=$dbh->prepare(" create table test_load(id number(10),uname varchar2(20), phone varchar2(20)) ");
$sth->execute();

my $sth=$dbh->prepare(" select * from user_tables" );
$sth->execute();
while (@row = $sth->fetchrow_array()) {
        print "row's @row\n"
}
$dbh->disconnect or warn "DB disconnect failed: $DBI::errstr\n";
print "Disconnected from Oracle databae!\n";

