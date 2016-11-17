auto
sftp
control improve

文件夹config_file下为三个配置文件：
ftp_conn.unl为连接ftp的配置信息。内容：IP地址|用户名|密码|发送目录|
db_conn.unl为连接数据库的配置信息。内容：用户名|密码|数据库ID|
table.unl为加载表列表

文件夹control下为sqlldr控制文件，部署程序后，需先生成控制文件，以供今后加载所用

文件夹script下为加载所用脚本，其中get_z.sh为得到增量控制文件，get_data.sh为得到增量数据文件并解压,run_sqlldr.sh为将数据文件用sqlldr加载到数据库临时表

run.sh为总程序开启脚本
run.unl为程序运行开关，on为开启，off为关闭

load.sh为加载脚本，参数为发送目录名，运行此脚本会将该参数目录下的数据文件加载到Oracle库
