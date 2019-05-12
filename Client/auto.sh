# @Author: Angel_Kitty
# @Date:   2019-05-11 21:54:43
# @Last Modified by:   Angel_Kitty
# @Last Modified time: 2019-05-11 23:28:52

# Copyright (c) https://github.com/AngelKitty/ssr

# description: 开机自动启动的一键代理脚本启动程序
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
# 创建开机启动脚本
cd ~
if [[ ! -f "/etc/rc.local" ]]; then
	sudo touch /etc/rc.local
	# sudo vim /etc/rc.local
    echo "Start to edit the rc.local!!!"
    # 此部分为修改rc.local的配置信息
	sudo echo "#  This file is part of systemd." >> /etc/rc.local
	sudo echo "#" >> /etc/rc.local
	sudo echo "#  systemd is free software; you can redistribute it and/or modify it" >> /etc/rc.local
	sudo echo "#  under the terms of the GNU Lesser General Public License as published by" >> /etc/rc.local
	sudo echo "#  the Free Software Foundation; either version 2.1 of the License, or" >> /etc/rc.local
	sudo echo "#  (at your option) any later version." >> /etc/rc.local
	sudo echo -e '' >> /etc/rc.local
	sudo echo "# This unit gets pulled automatically into multi-user.target by" >> /etc/rc.local
	sudo echo "# systemd-rc-local-generator if /etc/rc.local is executable." >> /etc/rc.local
	sudo echo "[Unit]" >> /etc/rc.local
	sudo echo "Description=/etc/rc.local Compatibility" >> /etc/rc.local
	sudo echo "ConditionFileIsExecutable=/etc/rc.local" >> /etc/rc.local
	sudo echo "After=network.target" >> /etc/rc.local
	sudo echo -e '' >> /etc/rc.local
	sudo echo "[Service]" >> /etc/rc.local
	sudo echo "Type=forking" >> /etc/rc.local
	if [[ ! -f "/home/shadow_run.sh" ]]; then
		wget https://raw.githubusercontent.com/AngelKitty/ssr/master/Client/shadow_install.sh
		chmod 777 shadow_install.sh
		sudo bash shadow_install.sh
	fi
	sudo cp /home/shadow_run.sh /etc/shadow_run.sh
	sudo echo "ExecStart=/etc/rc.local /etc/shadow_run.sh start" >> /etc/rc.local
	sudo echo "TimeoutSec=0" >> /etc/rc.local
	sudo echo "RemainAfterExit=yes" >> /etc/rc.local
    sudo echo -e '' >> /etc/rc.local
	sudo echo "[Install]" >> /etc/rc.local
	sudo echo "WantedBy=multi-user.target" >> /etc/rc.local
	sudo echo "Alias=rc-local.service" >> /etc/rc.local
	# rc.local文件修改完成
	echo "Finish deploying the rc.local!!!"
fi
echo "this just a test" > /usr/local/text.log
sudo ln -s /lib/systemd/system/rc.local.service /etc/systemd/system/
# 添加启动项
sudo systemctl start rc.local
# 刷新配置
sudo systemctl daemon-reload
# 执行服务命令
sudo systemctl start rc-local.service
