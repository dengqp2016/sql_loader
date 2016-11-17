#!/bin/sh
#2015-01-30
#writed by dengqingpu
#配置CDD映射时忘记加上出口文件控制程序，通过以下命令可以将错误的落地文件修改为CDD后半段加载程序识别的正常文件
sed -i 's/,//g' LCAPPNT.D2015028.T115750342
sed -i 's/"//g' LCAPPNT.D2015028.T115750342
sed -i 's/$/LCAPPNT/' LCAPPNT.D2015028.T115750342
