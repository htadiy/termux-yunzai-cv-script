#!/bin/bash
# 安装miaoyunzai用
# 233年6月21日の大改
#ver beta0.1

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo -e "\e[1;31m请使用root用户来使用此脚本！\e[0m"
  exit 1
fi

echo -e "\e[1;31m权限检查已通过！开始部署喵崽...\e[0m"

# 克隆 Miao-Yunzai 仓库
apt update
apt upgrade
echo -e "\e[1;31m正在安装依赖\e[0m"
apt-get install wget -y
apt-get install curl -y
apt install git -y
apt install chromium-browser -y
apt install -y --force-yes --no-install-recommends fonts-wqy-microhei
echo -e "\e[1;31m开始安装nodejs v20\e[0m"
apt-get update && apt-get install -y ca-certificates gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update && apt-get install nodejs -y
apt install redis-server -y
echo -e "\e[1;31m正在从github获取并安装云崽，请耐心等待\e[0m"
if [ ! -d "$HOME/Miao-Yunzai/" ]; then # 如果不存在 Yunzai-Bot 文件夹
  git clone --depth=1 https://github.com/yoimiya-kokomi/Miao-Yunzai.git ~/Miao-Yunzai
   echo -e "\e[1;31m正在安装pnpm...\e[0m"
    npm --registry=https://registry.npmmirror.com install pnpm -g
    echo -e "\e[1;31m正在安装依赖\e[0m"
    cd $HOME/Miao-Yunzai/
    pnpm config set registry https://registry.npmmirror.com
    pnpm install -P
    cd $HOME/Miao-Yunzai
    git clone --depth=1 https://github.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
    if [ ! -d "$HOME/Miao-Yunzai/" ]; then # 如果没有克隆成功
        echo "克隆失败，请报告开发者"
    else # 如果克隆成功
        echo -e "\e[1;31m安装成功！\e[0m"
    fi
else # 如果已经存在 Yunzai-Bot 文件夹，则不再克隆项目
    echo -e "\e[1;31mMiao-Yunzai已安装\e[0m"
    cd $HOME/Miao-Yunzai
    echo -e "\e[1;31m开始检测是否安装了nodejs...\e[0m"
    if node -v > /dev/null 2>&1; then
      echo -e "\e[1;31m已安装nodejs，正在检测nodejs版本是否小于16...\e[0m"
      node_version=$(node -v)
      if [ "$(echo "$node_version 16" | awk '{print ($1 < $2)}')" -eq 1 ]; then
        echo -e "\e[1;31m版本nodejs小于16，正在更新...\e[0m"
        apt remove nodejs
        apt remove libnode72
        curl -sL https://deb.nodesource.com/setup_18.x | bash -
        apt-get install nodejs -y
      else
        echo -e "\e[1;31m版本无问题，继续\e[0m"
      fi
    else
      echo -e "\e[1;31m你根本没安装nodejs，正在为您安装...\e[0m"
      curl -sL https://deb.nodesource.com/setup_16.x | bash -
      apt-get install nodejs -y
    fi
    echo "开始检测是否安装miao-plugin..."
    if [ ! -d "$HOME/Miao-Yunzai/plugins/miao-plugin" ]; then # 如果没有miao-plugin
        echo -e "\e[1;31m检测到你没有安装，即将开始安装！\e[0m"
        cd $HOME/Miao-Yunzai
        git clone --depth=1 https://github.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
        pnpm install -P
    else # 如果有miao-plugin
        echo -e "\e[1;31m看来你已经装了，保险一点再给你装一下依赖吧\e[0m"
        pnpm install -P
    fi
fi
redis-server --save 900 1 --save 300 10 --daemonize yes --ignore-warnings
echo "如果没错是克隆好了，5秒后返回脚本"
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/miao-menu.sh)