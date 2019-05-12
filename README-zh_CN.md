# ssr

[![Build Status](https://camo.githubusercontent.com/ac916b3306b3ceb0b10480f46633b35ba3a17b50/68747470733a2f2f7472617669732d63692e6f72672f6374662d77696b692f6374662d77696b692e7376673f6272616e63683d6d6173746572)](https://github.com/AngelKitty/ssr)

[中文](https://github.com/AngelKitty/ssr/blob/master/README-zh_CN.md) [English](https://github.com/AngelKitty/ssr/blob/master/README.md)

此项目是用于设置 ssr 客户端和服务器的自动工具，ssr 是一个快速隧道代理，可帮助您绕过防火墙。

## 服务端

### 文档

您可以参考[文章](https://github.com/AngelKitty/ssr/blob/master/Server/README.md)，然后一步一步完成安装过程。

### 安装

Debian / Ubuntu / CentOS:

```shell
ssh root@xxx.xxx.xxx.xxx
wget https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh
chmod +x ssr.sh
./ssr.sh
```

或者你可以选择以下方式安装：

Debian / Ubuntu:

```shell
ssh root@xxx.xxx.xxx.xxx
sudo apt install -y git
git clone https://github.com/AngelKitty/ssr.git
cd ssr/Server
chmod +x ssr.sh
./ssr.sh
```

CentOS:

```shell
ssh root@xxx.xxx.xxx.xxx
sudo yum install -y git
git clone https://github.com/AngelKitty/ssr.git
cd ssr/Server
chmod +x ssr.sh
./ssr.sh
```

## 客户端

### 文档

您可以参考[文章](https://github.com/AngelKitty/ssr/blob/master/Client/README.md)，然后一步一步完成安装过程。

### 安装

Debian / Ubuntu:

```shell
sudo apt install git
git clone https://github.com/AngelKitty/ssr.git
cd ssr/Client
sudo chmod 777 auto.sh
sudo bash auto.sh 
```

或者你可以从[这里](https://raw.githubusercontent.com/AngelKitty/ssr/master/Client/auto.sh)得到安装脚本

## 许可

Copyright © 2019 https://github.com/AngelKitty/ssr

根据 Apache 许可证 2.0 版(“许可证”)获得许可。除非符合许可，否则您不得使用此文件。您可以在以下位置获取许可证：

```
http://www.apache.org/licenses/LICENSE-2.0
```

除非适用法律要求或书面同意，否则根据许可证分发的软件将按“原样”分发，不附带任何明示或暗示的担保或条件。有关管理许可下的权限和限制的特定语言，请参阅许可证。

## 问题反馈

- [Issue Tracker](https://github.com/AngelKitty/ssr/issues?state=open)