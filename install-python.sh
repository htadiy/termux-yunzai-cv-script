#!/bin/bash
# 安装python3.10
# 233年6月21日の大改
#ver beta0.1

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo "请使用root用户来使用此脚本！"
  exit 1
fi

echo "权限检查已通过！开始部署python环境..."

# 安装python3.10
apt update
apt upgrade
echo -e "\e[1;36m  少女祈祷中..\e[0m"
echo "正在下载源码..." 
wget https://www.python.org/ftp/python/3.10.8/Python-3.10.8.tgz
echo "开始解压源码..."
tar -zxvf Python-3.10.8.tgz -C ~
cd ~/
cd Python-3.10.8/
echo "开始安装编译所需依赖..."
apt-get install zlib1g-dev libbz2-dev libssl-dev libncurses5-dev  libsqlite3-dev libreadline-dev tk-dev libgdbm-dev libdb-dev libpcap-dev xz-utils libexpat1-dev   liblzma-dev libffi-dev  libc6-dev
echo "开始配置并编译..."
./configure
make
echo "开始安装..."
make install
ln -s /usr/local/bin/python3 /usr/local/bin/python
ln -s /usr/local/bin/pip3 /usr/local/bin/pip
clear
echo "如果下方出现Python 3.10.8，即安装成功。"
python -V
sleep 7
echo "开始优化pip"
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/
pip install poetry
echo "五秒后将退出脚本..."
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/miao-menu.sh)