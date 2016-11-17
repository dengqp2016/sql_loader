#!usr/bin/perl
#################################################################################
# Script Function: ����sqlloader�����нű��Լ������ļ��ű�
# Script File    : run_sqlldr.pl
# Script Version : 2014-04-21
# Script Parameters:  �������Ϊ���ر�ı�����
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
#####################################################
#
#   Automation�Ŀ����ļ���ʽΪ dir.<ϵͳ���>.<����>.<��������>.<���κ�>.<���к�>.<�ش����>.<�����ṩ��ʽ>
#
#####################################################
my $control=$ARGV[0] ;             #�����ļ�����   
my $dbuser    =$ARGV[2];
my $password  =$ARGV[3];
my $schema    =$ARGV[2];
my $dsn       =$ARGV[4];
$home         =$ARGV[1];

#my $dbuser    ="****";            #���иýű���Oracle�û�
#my $password  ="****";            #dbuser������
#my $schema    ="****";            #����Oracle���ݿ��õ�schema
#my $dsn       ="****";            #��Oracle���ݿ��TNS
#$home         ="****";            #�ű����Ŀ¼
#my $table_name;                   #Ҫ���ɿ����ļ��ı�����
my $filename;                      #sqlloader�������ݿ�������ļ�
my $space   ;                      #�����ļ��м�¼�������ļ���С
my $rowcount;                      #�����ļ��м�¼�������ļ�����


my ($dir,$sysname,$table_name,$date,$batch_no,$res_no,$flag)=split('\.',$control);
#print "tablename-->$table_name\n";

$table_name   =~ tr/[A-Z]/[a-z]/ ;

#####################################################
#
#   ����sqlloader���߼�������
#
#####################################################

sub run_sqlldr{

open(FILE,$control);
while(<FILE>)

{
				($filename,$space,$rowcount)=split(' ',$_);

				
my $loader="sqlldr userid=$dbuser/$password\@${dsn} control=${home}/load/script/$table_name.ctl  data=${home}/load/data/$filename  bad=${home}/load/data/$table_name$date.bad log=${home}/load/log/$table_name$date.log";
print "run sqlloader script:\n";
print "$loader\n";
my $ret_load=system("$loader");


if ($ret_load==0)
{
				#return 0;
				
				}
else
{
				return 1;
				exit;
				}				
				
				}
return 0;

}				

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

###########################################
# �������Ϊδ����չʹ�ã���ǰ�����ݼ���
# ����������ټ��أ���������ļ��м�¼���������ļ�
# ��ctl�ļ��е�truncateҪ���ĳ�appendģʽ������
# ���ݼ���ǰҪ����ʱ���������
###########################################

sub run_sql
{
my $sqlStr = "insert into $schema.load_log(control_name,load_time,load_flagCod,load_flagName) values ('$control',sysdate,'0','success')";
#print "$sqlStr";
my $sth = $dbh->prepare($sqlStr);

my $ret = $sth->execute();

$sth->finish();

$dbh->disconnect ||warn $dbh->errstr;
return 0;

				}
				
sub run_sql_false
{
my $sqlStr = "insert into $schema.load_log(control_name,load_time,load_flagCod,load_flagName) values ('$control',sysdate,'1','false')";
#print "$sqlStr";
my $sth = $dbh->prepare($sqlStr);

my $ret = $sth->execute();

$sth->finish();

$dbh->disconnect ||warn $dbh->errstr;
return 0;

				}

#####################################################################################		
#����������
#
#####################################################################################		
sub main{
				ODBconnect(); 
				my $ret=&run_sqlldr();
				if($ret==0)
				{
								my $ret1=&run_sql();
								print "load success!!!\n\n";
								return $ret;
								}				
				else
				{
								my $ret2=&run_sql_false();
								print "load faild!!!\n\n";
								return 1;
								}				
}
#				
my $ret=main();
exit($ret);
