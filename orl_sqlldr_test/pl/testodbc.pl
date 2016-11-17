#!/usr/bin/perl
##################################Declaration Section###############################
# Script Function: 用于测试perl是否包含base64方法
# Script File    : testbase64.pl
# Script Version : 1.0 2011-07-18
##################################Variable Section##################################

use strict;
use DBI;
sub connect_db
{
    my $dbh = DBI->connect("dbi:ODBC:$ARGV[0]", "$ARGV[1]", "$ARGV[2]");
    unless (defined($dbh)) {
         die "cann't connect database !";
    }
    return $dbh;
}

sub sampleSQL
{
    my ($dbh) = @_;
    
    unless (defined($dbh)) {
        return -1;
    }
    
    my $sqlStr = "SELECT CURRENT_DATE";

    my $sth = $dbh->prepare($sqlStr);
    unless ($sth) {
        print "Failed to prepare statement for $sqlStr.\n";
        return -1;
    }
    
    my $ret = $sth->execute();
    unless ($ret) {
        print "Failed to execute statement for $sqlStr.\n";
        return -1;
    }
    
    while (my @rows = $sth->fetchrow()) {
        print "rows:@rows.\n";
    }
    
    $sth->finish();
    
    return 0;
}

sub main
{
    my $dbh = connect_db();
    unless ($dbh) {
        print "Failed to invoke function connect_db().\n";
        return 1;
    }
    
    my $ret = sampleSQL($dbh);
    if ($ret < 0) {
        print "Failed to invoke function sampleSQL().\n";
        return -1;
    }

    print "Connect Teradata database ok.\n";
    return 0;
}

if ( $#ARGV != 2 ) {
    print "Usage: perl testodbc.pl <datasource> <userID> <passwd>.\n";
    exit(-1);
}

my $ret = main();

exit($ret);
