#!usr/bin/perl
#################################################################################
# Script Function: Éú³ÉsqlloaderµÄÔËĞĞ½Å±¾ÒÔ¼°¿ØÖÆÎÄ¼ş½Å±¾
# Script File    : load_procedure.pl
# Script Version : 2014-04-21
# Script Parameters:  ÊäÈë²ÎÊıÎªOracle¼ÓÔØ±íµÄÃû³Æ£¬´óĞ¡Ğ´½Ô¿É
#                  
#                  ¸Ã½Å±¾ÖĞµÄÊı¾İÁ¬½ÓÓÃ»§ÓëÃÜÂëÇë×ÔĞĞĞŞ¸Ä
###################################################################################
use DBI;
use strict;


###################################################################################
#   First Step
#   Connect Teradata to access parameter table ,in develop environment the table name is O2T_BATCH_TABLE
#   in the future it should be merged into  cdc_loading_job
#   This step is to get O2T 1/2 table name and load type 
#
###################################################################################



my $dbh;                           #for Oracle
my $home;                          #Éú³É¿ØÖÆÎÄ¼şµÄÄ¿Â¼
my $table_name=$ARGV[0];
my $dbuser    ="ORCL_SQLDR";            #ÔËĞĞ¸Ã½Å±¾µÄOracleÓÃ»§
my $password  ="123456";            #dbuserµÄÃÜÂë
my $schema    ="ORCL_SQLDR";            #µ¼ÈëOracleÊı¾İ¿âÓÃµÄschema
my $dsn       ="ods";              #¸ÃOracleÊı¾İ¿âµÄTNS
$home         ="/ods/goldengate/orl_sqlldr_test/sh";          #½Å±¾´æ·ÅÄ¿Â¼
$table_name   =~ tr/[A-Z]/[a-z]/ ;

###########################################
#ODBconnect function is for connect Oracle DaTabase 
###########################################

sub ODBconnect 
{
 $dbh = DBI->connect("dbi:Oracle:$dsn", "$schema","$password" );
 unless ($dbh) {
   print "Connect Oracle DataBase error!\n";
}
return 0;
	}

############################################################################
#´ÓOracleÖĞµÄÊı¾İ×Öµäuser_tab_columnsÖĞ»ñÈ¡¸Ã±íµÄÁĞÃû³ÆÊı×é
#´«ÈëµÄÊÇÈ«¾Ö²ÎÊı$table_name;
#Êä³öÎªÁĞÊı×é£¬°´column_idµÄË³ĞòÊä³ö
############################################################################

sub get_col_name{

## Get the table name through perl print 

my $sqlStr = "select column_name,data_type from user_tab_columns where table_name=upper('$table_name') order by column_id";
                        
my $sth = $dbh->prepare($sqlStr);
my $ret = $sth->execute();
my (@ary);              #´æ·Å²éÑ¯Êı¾İÊı×é

my (@myary);
my $i=0;
while(@ary=$sth->fetchrow_array()){

if($ary[1] eq "DATE")
{
$myary[$i]=$ary[0]." DATE \"yyyy-mm-dd hh24:mi:ss\"";
$i=$i+1;	
	}
else
{	
$myary[$i]=$ary[0];
#print $myary[$i]."\n";
$i=$i+1;
}
	};

$sth->finish();
return @myary;

}

sub get_files
{
my $control_file;
my $sqlloader_file;
my @col=get_col_name();
my $i=0;         #¼ÆÊıÆ÷
##################################################################
#
#  Éú³ÉsqlloaderµÄ¿ØÖÆÎÄ¼ş
#
##################################################################
open (CFILE,">$home/load/script/$table_name.ctl") or die "open file failed"; 
print CFILE "LOAD DATA \n";
print CFILE "APPEND INTO TABLE  $schema.$table_name\n";
print CFILE "FIELDS TERMINATED BY '|'\n";
print CFILE "(";
foreach (@col)
{
	if ($i==0)
	#print "$_\n";
   	{ 
		print CFILE "$_\n";
		$i=$i+1;
	   }
	else
	   	{ 
		print CFILE ",$_\n";
		$i=$i+1;
	   }
	
	}

print CFILE ")\n";
close CFILE;

print "Create Control File $table_name.ctl successful!\n";
print "The file now in the directory $home/load/script/ \n";
##################################################################
#
#  Éú³ÉsqlloaderÔËĞĞ½Å±¾
#
##################################################################

#open (SFILE,">$home/load/script/$table_name.ldr") or die "open file failed"; 
#print SFILE "sqlldr userid=$dbuser/$password\@${dsn} control=${home}/load/script/$table_name.ctl  data=${home}/load/data/test.data\n";
#close SFILE;
return 0;

}
	
	
#####################################################################################	
#Ö÷º¯Êıµ÷ÓÃ
#
#####################################################################################	
sub main{
	
	my $ret;

ODBconnect();

my $ret=&get_files();
if($ret==0)
{
$dbh->disconnect ||warn $dbh->errstr;

return 0;
	}
#
else
{
	print "Create Control File $table_name.ctl failed!\n";
return 1;	
	}	
}
my $ret1=main();
exit($ret1);
