#!/bin/bash
# 菜单脚本
# 233年6月21日の大改
#beta0.1版

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo "请使用root用户来使用此脚本！"
  exit 1
fi

echo "权限检查已通过！"
check_arch() {
    arch=$(dpkg --print-architecture)
    if [ "$arch" = "arm64" ] || [ "$arch" = "armhf" ] || [ "$arch" = "amd64" ] || [ "$arch" = "armel" ]; then
        echo "恭喜您的设备 $arch 支持此脚本！"
        return 0
    else
        echo "本脚本暂不支持您的设备架构 $arch 。"
        return 1
    fi
}

check_arch


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
  echo "正在启动 Miao-Yunzai..."
  cd $HOME/Miao-Yunzai
  redis-server --save 900 1 --save 300 10 --daemonize yes --ignore-warnings
  node app
}

function install_plugins {
  bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/plugin.sh)
}

function install_fonts-wqy-microhei {
  # 安装中文字体
  echo "正在安装中文字体"
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
echo "开始尝试修复..."
export PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"
echo "作者为你祈祷修复成功^o^"
}

# 显示菜单
echo "-----------菜单 Made By 铁锅炖派蒙-------------"
echo "              请选择要执行的操作："
echo "              1. 安装依赖的软件包"
echo "              2. 一键安装Miao-Yunzai"
echo "              3. 安装 nodejs"
echo "              4. 安装python（编译安装，支持大部分平台）"
echo "              5. 启动 Miao-Yunzai"
echo "              6. 安装插件"
echo "              7. 安装中文字体"
echo "              8. Tmoe-Linux安装云崽"
echo "              9. 修复Chromium启动失败问题（不知道可不可行）"
echo "              10. 安装ffmpeg（编译安装，支持大部分平台）"
echo "              q. 退出脚本"
echo "---------------------------------------------"

# 读取用户输入
read -p "请输入您要执行的操作字符：" choice

# 根据用户输入的选项执行相应的函数
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
  q) quit ;;
  *) echo "无效选项" ;;
esac