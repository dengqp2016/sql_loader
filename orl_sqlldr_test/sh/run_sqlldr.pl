#!usr/bin/perl
#################################################################################
# Script Function: 生成sqlloader的运行脚本以及控制文件脚本
# Script File    : run_sqlldr.pl
# Script Version : 2014-04-21
# Script Parameters:  输入参数为加载表的表名成
#                  
#                  该脚本中的数据连接用户与密码请自行修改
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
my $home;                          #生成控制文件的目录
#####################################################
#
#   Automation的控制文件格式为 dir.<系统简称>.<表名>.<数据日期>.<批次号>.<序列号>.<重传序号>.<数据提供方式>
#
#####################################################
my $control=$ARGV[0] ;             #控制文件名称   

#my $table_name;                   #要生成控制文件的表名成
my $dbuser    ="ORCL_SQlDR";            #运行该脚本的Oracle用户
my $password  ="123456";            #dbuser的密码
my $schema    ="ORCL_SQLDR";            #导入Oracle数据库用的schema
my $dsn       ="ods";              #该Oracle数据库的TNS
my $filename;                      #sqlloader导入数据库的数据文件
my $space   ;                      #控制文件中记录的数据文件大小
my $rowcount;                      #控制文件中记录的数据文件行数
$home         ="/ods/goldengate/orl_sqlldr_test/sh";          #脚本存放目录


my ($dir,$sysname,$table_name,$date,$batch_no,$res_no,$flag)=split('\.',$control);
#print "tablename-->$table_name\n";

$table_name   =~ tr/[A-Z]/[a-z]/ ;

#####################################################
#
#   调用sqlloader工具加载数据
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
# 这个函数为未来扩展使用，当前的数据加载
# 都是先清空再加载，如果控制文件中记录几个数据文件
# 则ctl文件中的truncate要更改成append模式，但是
# 数据加载前要把临时表数据清空
###########################################

sub run_sql
{
	
my $sqlStr = "truncate table $schema.$table_name";
my $sth = $dbh->prepare($sqlStr);

my $ret = $sth->execute();

$sth->finish();

$dbh->disconnect ||warn $dbh->errstr;
return 0;

	}
	
#####################################################################################	
#主函数调用
#
#####################################################################################	
sub main{
	ODBconnect(); 
	my $ret1=&run_sql();
	if($ret1==0)
	{
		print "truncate table $schema.$table_name success,begin run sqlloader\n";
		my $ret=&run_sqlldr();
		return $ret;
		}
	else
	{
		return 1;
		}
}
#	
my $ret1=main();
exit($ret1);
