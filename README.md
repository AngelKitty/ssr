# ssr

[![Build Status](https://camo.githubusercontent.com/ac916b3306b3ceb0b10480f46633b35ba3a17b50/68747470733a2f2f7472617669732d63692e6f72672f6374662d77696b692f6374662d77696b692e7376673f6272616e63683d6d6173746572)](https://github.com/AngelKitty/ssr)

[中文](https://github.com/AngelKitty/ssr/blob/master/README-zh_CN.md) [English](https://github.com/AngelKitty/ssr/blob/master/README.md)

Autotools for set up ssr client and server, ssr is a fast tunnel proxy that helps you bypass firewalls.

## Server

### Document

You can Refer to the [article](https://github.com/AngelKitty/ssr/blob/master/Server/README.md), and then step by step to finish the installation process.

### Install

Debian / Ubuntu / CentOS:

```shell
ssh root@xxx.xxx.xxx.xxx
wget https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh
chmod +x ssr.sh
./ssr.sh
```

Or you can choice the following way to do:

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

## Client

### Document

You can Refer to the [article](https://github.com/AngelKitty/ssr/blob/master/Client/README.md), and then step by step to finish the installation process.

### Install

Debian / Ubuntu:

```shell
sudo apt install git
git clone https://github.com/AngelKitty/ssr.git
cd ssr/Client
sudo chmod 777 auto.sh
sudo bash auto.sh 
```

or you can get the script from the [there](<https://raw.githubusercontent.com/AngelKitty/ssr/master/Client/auto.sh>)

## License

Copyright © 2019 https://github.com/AngelKitty/ssr

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

```
http://www.apache.org/licenses/LICENSE-2.0
```

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

## Bugs and Issues

- [Issue Tracker](https://github.com/AngelKitty/ssr/issues?state=open)