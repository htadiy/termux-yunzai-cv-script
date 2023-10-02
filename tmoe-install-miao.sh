#!/bin/bash
# tmoe部署用
# 233年6月21日の大改
# 内部ver0.1

check_arch() {
    arch=$(dpkg --print-architecture)
    if [ "$arch" = "arm64" ]; then
        echo "恭喜你的设备架构 $arch 支持安装喵崽！"
        return 0
    else
        echo "你的设备架构 $arch 不支持这个脚本，本tmoe安装脚本只适用于arm64。"
        exit
    fi
}
check_arch
apt update
apt upgrade #更新源
echo "开始尝试安装pip..."
apt install python3-pip
echo "pip安装命令执行完成！"
ln -s /usr/bin/python3.10 /usr/bin/python
echo "开始尝试安装poetry..."
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install poetry
echo "poetry安装命令执行完成！"
echo "开始尝试安装chromium..."
apt install chromium-browser -y
echo "chromium安装命令执行完成！"
echo "开始尝试安装中文字体和redis..."
apt install --force-yes --no-install-recommends fonts-wqy-microhei
apt install redis-server
echo "中文字体安装和redis安装命令执行完成！"
echo "开始尝试安装nodejs..."
apt remove nodejs
apt remove libnode72
curl -sL https://deb.nodesource.com/setup_18.x | bash -
apt-get install nodejs -y # 安装 node.js
echo "执行nodejs安装命令完成！"
echo "正在克隆 Miao-Yunzai 仓库..."
  if [ ! -d "$HOME/Miao-Yunzai/" ]; then # 如果不存在 Yunzai-Bot 文件夹
    git clone --depth=1 https://github.com/yoimiya-kokomi/Miao-Yunzai.git ~/Miao-Yunzai # 克隆 Miao-Yunzai 项目
      # 安装模块
    echo "正在安装模块..."
    npm --registry=https://registry.npmmirror.com install pnpm -g # 使用 npm 安装 pnpm 包管理器
      # 安装依赖
    echo "正在安装依赖"
    cd $HOME/Miao-Yunzai/
    pnpm config set registry https://registry.npmmirror.com # 配置 pnpm 的镜像源为 npmmirror.com
    echo "开始安装Miao-Plugin..."
    cd $HOME/Miao-Yunzai
    git clone --depth=1 https://github.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
    pnpm install -P # 使用 pnpm 安装项目的依赖
    if [ ! -d "$HOME/Miao-Yunzai/" ]; then # 如果没有克隆成功
        echo "克隆失败"
        exit 0 # 退出脚本
    else # 如果克隆成功
        echo "克隆完成"
    fi
  else # 如果已经存在 Yunzai-Bot 文件夹，则不再克隆项目
    echo "Miao-Yunzai已安装"
    echo "正在检测nodejs是否安装..."
    if node -v > /dev/null 2>&1; then
      echo "nodejs已安装，让我看看nodejs版本是否小于16..."
      node_version=$(node -v)
      if [ "$(echo "$node_version 16" | awk '{print ($1 < $2)}')" -eq 1 ]; then
        echo "nodejs版本小于16，即将更新..."
        apt remove nodejs
        apt remove libnode72
        curl -sL https://deb.nodesource.com/setup_18.x | bash -
        apt-get install nodejs -y
      else
        echo "不错，nodejs版本大于等于16，让我们继续吧"
      fi
    else
      echo "你根本没安装nodejs，即将开始安装..."
      curl -sL https://deb.nodesource.com/setup_18.x | bash -
      apt-get install nodejs -y
    fi
    echo "开始检测是否安装miao-plugin..."
    if [ ! -d "$HOME/Miao-Yunzai/plugins/miao-plugin" ]; then
        echo "检测到你没有安装，即将开始安装！"
        cd $HOME/Miao-Yunzai
        git clone --depth=1 https://github.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
        pnpm install -P
    else # 如果有miao-plugin
        echo "看来你已经装了，保险一点再给你装一下依赖吧"
        pnpm install -P
    fi
fi
echo "如果大概应该没错没错的话应该部署完成了，5秒后返回脚本"
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/miao-menu.sh)