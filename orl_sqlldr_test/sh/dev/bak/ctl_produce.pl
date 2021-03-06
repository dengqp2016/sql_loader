#!usr/bin/perl
#################################################################################
# Script Function: 生成sqlloader的运行脚本以及控制文件脚本
# Script File    : load_procedure.pl
# Script Version : 2014-04-21
# Script Parameters:  输入参数为Oracle加载表的名称，大小写皆可
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
my $table_name=$ARGV[0];
my $dbuser    ="ORCL_SQLDR";            #运行该脚本的Oracle用户
my $password  ="123456";            #dbuser的密码
my $schema    ="ORCL_SQLDR";            #导入Oracle数据库用的schema
my $dsn       ="ods";              #该Oracle数据库的TNS
#$home        ="/ods/goldengate/orl_sqlldr_test/sh";          #脚本存放目录
$home         =$ARGV[1];
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
#从Oracle中的数据字典user_tab_columns中获取该表的列名称数组
#传入的是全局参数$table_name;
#输出为列数组，按column_id的顺序输出
############################################################################

sub get_col_name{

## Get the table name through perl print 

my $sqlStr = "select column_name,data_type from user_tab_columns where table_name=upper('$table_name') order by column_id";
                        
my $sth = $dbh->prepare($sqlStr);
my $ret = $sth->execute();
my (@ary);              #存放查询数据数组

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
my $i=0;         #计数器
##################################################################
#
#  生成sqlloader的控制文件
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
#  生成sqlloader运行脚本
#
##################################################################

#open (SFILE,">$home/load/script/$table_name.ldr") or die "open file failed"; 
#print SFILE "sqlldr userid=$dbuser/$password\@${dsn} control=${home}/load/script/$table_name.ctl  data=${home}/load/data/test.data\n";
#close SFILE;
return 0;

}
	
	
#####################################################################################	
#主函数调用
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
