yum install wget -y
yum install firewalld -y
systemctl enable firewalld
wget https://buildlogs.centos.org/c7.1511.00/kernel/20151119220809/3.10.0-327.el7.x86_64/kernel-3.10.0-327.el7.x86_64.rpm
yum install kernel-3.10.0-327.el7.x86_64.rpm -y
reboot

wget https://appdown.rrysapp.com/rrshareweb_centos7.tar.gz
tar -zxvf rrshareweb_centos7.tar.gz
rm -rf rrshareweb*.tar.gz rrshareweb_linux.rar WEB*.png
firewall-cmd --zone=public --add-port=12306/tcp --permanent
firewall-cmd --reload

cat > /etc/systemd/system/renren.service <<EOF
[Unit]
Description=RenRen server
After=network.target
Wants=network.target

[Service]
Type=simple
PIDFile=/var/run/renren.pid
ExecStart=/root/rrshareweb/rrshareweb
RestartPreventExitStatus=23
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

sed -i "s/3001/12306/g" rrshareweb/conf/rrshare.json

systemctl start renren
#systemctl stop renren
systemctl status renren
systemctl enable renren







