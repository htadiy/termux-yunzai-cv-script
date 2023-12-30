#!/bin/bash
# 安装python3.10
# 233年6月21日の大改
#ver beta0.1

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo -e "\e[1;31m请使用root用户来使用此脚本！\e[0m"
  exit 1
fi

echo -e "\e[1;31m权限检查通过，开始部署Python环境...\e[0m"

# 安装python3.10
apt update
apt upgrade
apt install git -y
echo -e "\e[1;36m  少女祈祷中..\e[0m"
echo -e "\e[1;31m正在下载Python-3.10.8源码...\e[0m" 
git clone https://gitee.com/paimon114514/python3.10.8.git ~/Python
cd $HOME/Python/
echo -e "\e[1;31m开始解压源码\e[0m"
tar -zxvf Python-3.10.8.tgz -C ~
cd ~/
cd Python-3.10.8/
echo -e "\e[1;31m开始安装所需依赖...\e[0m"
apt-get install zlib1g-dev libbz2-dev libssl-dev libncurses5-dev  libsqlite3-dev libreadline-dev tk-dev libgdbm-dev libdb-dev libpcap-dev xz-utils libexpat1-dev   liblzma-dev libffi-dev  libc6-dev
echo -e "\e[1;31m开始配置并编译...\e[0m"
./configure
make
echo -e "\e[1;31m开始安装...\e[0m"
make install
ln -s /usr/local/bin/python3 /usr/local/bin/python
ln -s /usr/local/bin/pip3 /usr/local/bin/pip
clear
echo -e "\e[1;31m如果下方出现Python 3.10.8，即安装成功\e[0m"
python -V
sleep 7
echo -e "\e[1;31m开始优化pip\e[0m"
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/
pip install poetry
echo -e "\e[1;36m  正在删除临时文件...\e[0m"
rm -rf ~/Python/
rm -rf ~/Python-3.10.8/
echo "五秒后将退出脚本..."
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/miao-menu.sh)
