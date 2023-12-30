#!/bin/bash
# 安装nodejs用
# 233年6月21日の大改
#ver beta0.1

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo -e "\e[1;31m请使用root用户来使用此脚本！\e[0m"
  exit 1
fi
echo -e "\e[1;31m权限检查通过，开始部署nodejs...\e[0m"
# 安装nodejs
echo -e "\e[1;31m正在安装nodejs...\e[0m"
apt remove nodejs
apt remove libnode72
apt-get update && apt-get install -y ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update && apt-get install nodejs -y
clear
echo "安装完成，即将返回脚本"
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/miao-menu.sh)