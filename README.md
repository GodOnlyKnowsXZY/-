# 人人影视-centos7
# rrshareweb-centos7

#修改端口默认port12306

systemctl restart renren  重启服务 
systemctl stop renren     停止服务 
systemctl start renren    开启服务 
systemctl disable/enable renren 停止/允许开机自启


wget -N --no-check-certificate "https://github.com/GodOnlyKnowsXZY/-/blob/master/rrclc.sh" && chmod +x rrclc.sh && ./rrclc.sh
