#!usr/bin/perl
#################################################################################
# Script Function: ����sqlloader�����нű��Լ������ļ��ű�
# Script File    : load_procedure.pl
# Script Version : 2014-04-21
# Script Parameters:  �������ΪOracle���ر�����ƣ���Сд�Կ�
#                  
#                  �ýű��е����������û��������������޸�
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
my $home;                          #���ɿ����ļ���Ŀ¼
my $table_name=$ARGV[0];
my $dbuser    ="ORCL_SQLDR";            #���иýű���Oracle�û�
my $password  ="123456";            #dbuser������
my $schema    ="ORCL_SQLDR";            #����Oracle���ݿ��õ�schema
my $dsn       ="ods";              #��Oracle���ݿ��TNS
$home         ="/ods/goldengate/orl_sqlldr_test/sh";          #�ű����Ŀ¼
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
#��Oracle�е������ֵ�user_tab_columns�л�ȡ�ñ������������
#�������ȫ�ֲ���$table_name;
#���Ϊ�����飬��column_id��˳�����
############################################################################

sub get_col_name{

## Get the table name through perl print 

my $sqlStr = "select column_name,data_type from user_tab_columns where table_name=upper('$table_name') order by column_id";
                        
my $sth = $dbh->prepare($sqlStr);
my $ret = $sth->execute();
my (@ary);              #��Ų�ѯ��������

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
my $i=0;         #������
##################################################################
#
#  ����sqlloader�Ŀ����ļ�
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
#  ����sqlloader���нű�
#
##################################################################

#open (SFILE,">$home/load/script/$table_name.ldr") or die "open file failed"; 
#print SFILE "sqlldr userid=$dbuser/$password\@${dsn} control=${home}/load/script/$table_name.ctl  data=${home}/load/data/test.data\n";
#close SFILE;
return 0;

}
	
	
#####################################################################################	
#����������
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
