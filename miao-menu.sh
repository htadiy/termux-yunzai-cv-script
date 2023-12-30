#!/bin/bash
# 菜单脚本
# 233年6月21日の大改
#beta0.1版

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo -e "\e[1;31m请使用root用户来使用此脚本！\e[0m"
  exit 1
fi

echo -e "\e[1;31m权限检查通过！\e[0m"
check_arch() {
    arch=$(dpkg --print-architecture)
    if [ "$arch" = "arm64" ] || [ "$arch" = "armhf" ] || [ "$arch" = "amd64" ] || [ "$arch" = "armel" ]; then
        echo -e "\e[1;31m恭喜您的设备 $arch 支持本脚本！\e[0m"
        return 0
    else
        echo -e "\e[1;31m本脚本暂不支持您的设备架构 $arch \e[0m"
        return 1
    fi
}

check_arch

if [ -e ca.deb ]; then
  echo -e "\e[1m由于你使用的系统非Tmoe-Linux，正在修复系统BUG...\e[0m"
  apt update
  apt install openssl -y
  dpkg -i ca.deb
  apt update -y
  apt upgrade -y
  apt install curl -y
  rm -rf ca.deb
fi

apt install whiptail -y

whiptail --title "菜单Made by htadiy" --menu "请选择你需要的选项：" 25 60 11 \
    "1" "安装依赖的软件包" \
    "2" "一键安装Miao-Yunzai" \
    "3" "安装nodejs" \
    "4" "安装python（编译安装，支持大部分平台）" \
    "5" "启动Miao-Yunzai" \
    "6" "安装插件" \
    "7" "安装中文字体" \
    "8" "Tmoe-Linux安装云崽" \
    "9" "修复Chromium启动失败问题（不知道可不可行）" \
    "10" "安装ffmpeg（编译安装，支持大部分平台）" \
    "0" "退出脚本" 2> choice

choice=$(cat choice)

function install_packages {
  bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/install-package.sh)
}

function install_nodejs {
  bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/install-nodejs.sh)
}

function install_python {
  bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/install-python.sh)
}

function clone_repository {
  bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/clone-miao-yunzai.sh)
}

function start_Miao-Yunzai {
  # 启动 Miao-Yunzai
  echo -e "\e[1;31m正在启动Miao-Yunzai...\e[0m"
  cd $HOME/Miao-Yunzai
  redis-server --save 900 1 --save 300 10 --daemonize yes --ignore-warnings
  node app
}

function install_plugins {
  bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/plugin.sh)
}

function install_fonts-wqy-microhei {
  # 安装中文字体
  echo -e "\e[1;31m正在安装中文字体...\e[0m"
  apt install -y --force-yes --no-install-recommends fonts-wqy-microhei
}

function install_Miao-Yunzai-Tmoe {
  bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/tmoe-install-miao.sh)
}

function ffmpeg {
  bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/ffmpeg.sh)
}

function quit {
  exit 0
}

function fix_puppeteer {
echo -e "\e[1;31m开始尝试修复...\e[0m"
export PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"
echo -e "\e[1;31m写入完成！可能修复不成功\e[0m"
}


case $choice in
  1) install_packages ;;
  2) clone_repository ;;
  3) install_nodejs ;;
  4) install_python ;;
  5) start_Miao-Yunzai ;;
  6) install_plugins ;;
  7) install_fonts-wqy-microhei ;;
  8) install_Miao-Yunzai-Tmoe ;;
  9) fix_puppeteer ;;
  10) ffmpeg ;;
  0) quit ;;
esac