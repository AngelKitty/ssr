# @Author: Angel_Kitty
# @Date:   2019-05-11 16:57:59
# @Last Modified by:   Angel_Kitty
# @Last Modified time: 2019-05-12 20:16:10
# Copyright (c) https://github.com/AngelKitty/ssr

# description: 开机自动启动的一键代理脚本安装程序
#=================================================
#	System Required: Debian/Ubuntu
#	Description: Install the ShadowsocksR Client
#	Version: 1.0
#	Author: Angel_Kitty
#	Blog: https://www.cnblogs.com/ECJTUACM-873284962/
#=================================================

#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
# Step1.安装ShadowsocksR客户端
cd ~
sudo apt install -y git
git clone https://github.com/ssrarchive/shadowsocksr.git
cd shadowsocksr
sudo cp config.json /etc/shadowsocks.json
# sudo vim /etc/shadowsocks.json
echo "Start to edit the shadowsocks.json!!!"
# 此部分为用户输入部分，即修改shadowsocks.json配置信息
echo && read -p "Please input Server IP Address: " SERVER
sudo sed -i 's/0.0.0.0/$SERVER/g' /etc/shadowsocks.json

echo && read -p "Please input Server IP Port: " SERVER_PORT
sudo sed -i 's/8388/$SERVER_PORT/g' /etc/shadowsocks.json

echo && read -p "Please input Server Login Password: " PASSWORD
sudo sed -i 's/"m"/"$PASSWORD"/g' /etc/shadowsocks.json

echo && read -p "Please input Method: " METHOD
sudo sed -i 's/aes-128-ctr/$METHOD/g' /etc/shadowsocks.json

echo && read -p "Please input Protocol: " PROTOCOL
sudo sed -i 's/auth_aes128_md5/$PROTOCOL/g' /etc/shadowsocks.json

echo && read -p "Please input Protocol Param: " PROTOCOL_PARAM
sudo sed -i 's/"protocol_param": "",/"protocol_param": "$PROTOCOL_PARAM",/g' /etc/shadowsocks.json

echo && read -p "Please input Obfs: " OBFS
sudo sed -i 's/tls1.2_ticket_auth_compatible/$OBFS/g' /etc/shadowsocks.json

echo && read -p "Please input Obfs Param: " OBFS_PARAM
sudo sed -i 's/"obfs_param": "",/"obfs_param": "$OBFS_PARAM",/g' /etc/shadowsocks.json
# shadowsocks.json文件修改完成
echo "Finish deploying the shadowsocks.json!!!"
# 这里是配置全局代理，解决终端get、wget无法使用socks5协议的问题，转换为http协议，加强通用性
# 这里是基于polipo方法
# 安装polipo
sudo apt install -y polipo
# sudo vim /etc/polipo/config
echo "Start to edit the config!!!"
# 此部分为修改config的配置信息
sudo sed -i 's/logSyslog = true/logSyslog = false/g' /etc/polipo/config
sudo echo -e '' >> /etc/polipo/config
sudo echo 'socksParentProxy = "127.0.0.1:1080"' >> /etc/polipo/config
sudo echo 'socksProxyType = socks5' >> /etc/polipo/config
sudo echo -e '' >> /etc/polipo/config
sudo echo 'chunkHighMark = 50331648' >> /etc/polipo/config
sudo echo 'objectHighMark = 16384' >> /etc/polipo/config
sudo echo -e '' >> /etc/polipo/config
sudo echo 'serverMaxSlots = 64' >> /etc/polipo/config
sudo echo 'serverSlots = 16' >> /etc/polipo/config
sudo echo 'serverSlots1 = 32' >> /etc/polipo/config
sudo echo -e '' >> /etc/polipo/config
sudo echo 'proxyAddress = "0.0.0.0"' >> /etc/polipo/config
sudo echo 'proxyPort = 8123' >> /etc/polipo/config
# config文件修改完成
echo "Finish deploying the config!!!"
# 重启Polipo
/etc/init.d/polipo restart
# 配置全局代理
sudo echo 'export http_proxy="http://127.0.0.1:8123/"' >> /etc/profile
# 或者你可以配置对应的终端编辑器，如bash，zsh，配置方式如下：
# sudo echo 'export http_proxy="http://127.0.0.1:8123/"' >> ~/.bashrc
# sudo echo 'export http_proxy="http://127.0.0.1:8123/"' >> ~/.zshrc
# 修改的配置文件生效
sudo source /etc/profile
# sudo source ~/.bashrc
# sudo source ~/.zshrc

# 安装python3
sudo apt install -y python3-pip
# 结束所有python3的进程
ps -ef | grep python3 | grep -v grep | cut -c 9-15 | xargs kill -s 9
# 安装screen，使用screen可以有效防止进程被误杀
sudo apt install -y screen
# Step2.创建并运行shadowsocks客户端脚本
if [[ ! -f  "/home/shadow_run.sh"]]; then
	sudo touch /home/shadow_run.sh
	sudo echo "#!/usr/bin/env bash" >> /home/shadow_run.sh
	sudo echo "screen python3 ~/shadowsocksr/shadowsocks/local.py -c /etc/shadowsocks.json" >> /home/shadow_run.sh
	sudo echo "/etc/init.d/polipo restart" >> /home/shadow_run.sh
	sudo chmod 777 /home/shadow_run.sh
fi
sudo bash /home/shadow_run.sh 
