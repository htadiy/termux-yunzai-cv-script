#!/bin/bash
# 安装nodejs用
# 233年6月21日の大改
#ver beta0.1

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo "请使用root用户来使用此脚本！"
  exit 1
fi
echo "权限检查已通过！开始部署nodejs..."
# 安装nodejs
echo "正在安装nodejs"
apt remove nodejs
apt remove libnode72
curl -sL https://deb.nodesource.com/setup_16.x | bash -
apt-get install nodejs -y # 安装 node.js
clear
echo "安装完成，即将返回脚本"
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://gitee.com/paimon114514/termux-yunzai-cv-script/raw/master/miao-menu.sh)