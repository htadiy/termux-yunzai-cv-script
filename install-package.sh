#!/bin/bash
# 安装依赖用
# 233年6月21日の大改
#ver beta0.1

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo "请使用root用户来使用此脚本！"
  exit 1
fi

echo "权限检查已通过！开始安装依赖包..."

echo -e "\e[1;36m  少女祈祷中..\e[0m"
echo "正在安装依赖的软件包..."
apt update && apt upgrade -y
apt install wget curl redis-server chromium-browser git -y
git config --global http.sslVerify false # 配置 Git 不验证 ssl 证书，以便拉取项目
# 启动 redis 服务，使用默认参数配置保存数据
redis-server --save 900 1 --save 300 10 --daemonize yes
apt install -y --force-yes --no-install-recommends fonts-wqy-microhei
clear
echo "安装依赖完成，5秒后返回脚本"
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/miao-menu.sh)