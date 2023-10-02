#!/bin/bash
# 安装miaoyunzai用
# 233年6月21日の大改
#ver beta0.1

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo "请使用root用户来使用此脚本！"
  exit 1
fi

echo "权限检查已通过！开始部署喵崽..."

# 克隆 Miao-Yunzai 仓库
apt update
apt upgrade
echo "开始安装依赖和nodejs..."
apt-get install wget -y # 安装 wget 工具
apt-get install -y curl # 安装 curl 工具
apt install git -y
apt install chromium-browser -y
apt install -y --force-yes --no-install-recommends fonts-wqy-microhei
curl -sL https://deb.nodesource.com/setup_16.x | bash -
apt update
apt-get install nodejs -y
apt install redis-server -y
echo "正在克隆 Miao-Yunzai 仓库..."
if [ ! -d "$HOME/Miao-Yunzai/" ]; then # 如果不存在 Yunzai-Bot 文件夹
  git clone --depth=1 https://gitee.com/yoimiya-kokomi/Miao-Yunzai.git ~/Miao-Yunzai # 克隆 Miao-Yunzai 项目
      # 安装模块
   echo "正在安装模块..."
    npm --registry=https://registry.npmmirror.com install pnpm -g # 使用 npm 安装 pnpm 包管理器
      # 安装依赖
    echo "正在安装依赖"
    cd $HOME/Miao-Yunzai/
    pnpm config set registry https://registry.npmmirror.com # 配置 pnpm 的镜像源为 npmmirror.com
    pnpm install -P # 使用 pnpm 安装项目的依赖
    cd $HOME/Miao-Yunzai
    git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
    if [ ! -d "$HOME/Miao-Yunzai/" ]; then # 如果没有克隆成功
        echo "克隆失败"
    else # 如果克隆成功
        echo "克隆完成"
    fi
else # 如果已经存在 Yunzai-Bot 文件夹，则不再克隆项目
    echo "Miao-Yunzai已安装"
    cd $HOME/Miao-Yunzai
    echo "开始检测是否安装nodejs..."
    if node -v > /dev/null 2>&1; then
      echo "nodejs已安装，让我看看nodejs版本是否小于16..."
      node_version=$(node -v)
      if [ "$(echo "$node_version 16" | awk '{print ($1 < $2)}')" -eq 1 ]; then
        echo "nodejs版本小于16，即将更新..."
        apt remove nodejs
        apt remove libnode72
        curl -sL https://deb.nodesource.com/setup_16.x | bash -
        apt-get install nodejs -y
      else
        echo "不错，nodejs版本大于等于16，让我们继续吧"
      fi
    else
      echo "你根本没安装nodejs，即将开始安装..."
      curl -sL https://deb.nodesource.com/setup_16.x | bash -
      apt-get install nodejs -y
    fi
    echo "开始检测是否安装miao-plugin..."
    if [ ! -d "$HOME/Miao-Yunzai/plugins/miao-plugin" ]; then # 如果没有miao-plugin
        echo "检测到你没有安装，即将开始安装！"
        cd $HOME/Miao-Yunzai
        git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
        pnpm install -P
    else # 如果有miao-plugin
        echo "看来你已经装了，保险一点再给你装一下依赖吧"
        pnpm install -P
    fi
fi
redis-server --save 900 1 --save 300 10 --daemonize yes --ignore-warnings ARM64-COW-BUG
echo "如果没错是克隆好了，5秒后返回脚本"
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://gitee.com/paimon114514/termux-yunzai-cv-script/raw/master/miao-menu.sh)