#!/bin/bash
# tmoe部署用
# 233年6月21日の大改
# 内部ver0.1

check_arch() {
    arch=$(dpkg --print-architecture)
    if [ "$arch" = "arm64" ]; then
        echo -e "\e[1;31m恭喜你的设备架构 $arch 支持安装Miao-Yunzai\e[0m"
        return 0
    else
        echo -e "\e[1;31m你的设备架构 $arch 不支持安装，本tmoe安装脚本不支持除arm64外的架构\e[0m"
        exit
    fi
}
check_arch
apt update
apt upgrade #更新源
echo -e "\e[1;31m开始尝试安装pip...\e[0m"
apt install python3-pip -y
ln -s /usr/bin/python3.10 /usr/bin/python
echo -e "\e[1;31m开始安装poetry\e[0m"
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install poetry
echo -e "\e[1;31m开始安装chromium...\e[0m"
apt install chromium-browser -y
echo -e "\e[1;31m开始安装redis和中文字体...\e[0m"
apt install --force-yes --no-install-recommends fonts-wqy-microhei
apt install redis-server -y
echo -e "\e[1;31m安装软件nodejs v18...\e[0m"
apt remove nodejs -y
apt remove libnode72 -y
apt-get update && apt-get install -y ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update && apt-get install nodejs -y
echo -e "\e[1;31m正在克隆Miao-Yunzai仓库...\e[0m"
  if [ ! -d "$HOME/Miao-Yunzai/" ]; then # 如果不存在 Yunzai-Bot 文件夹
    git clone --depth=1 https://github.com/yoimiya-kokomi/Miao-Yunzai.git ~/Miao-Yunzai # 克隆 Miao-Yunzai 项目
      # 安装模块
    echo -e "\e[1;31m正在安装pnpm...\e[0m"
    npm --registry=https://registry.npmmirror.com install pnpm -g # 使用 npm 安装 pnpm 包管理器
      # 安装依赖
    echo -e "\e[1;31m正在配置pnpm...\e[0m"
    cd $HOME/Miao-Yunzai/
    pnpm config set registry https://registry.npmmirror.com # 配置 pnpm 的镜像源为 npmmirror.com
    echo -e "\e[1;31m开始安装Miao-Plugin...\e[0m"
    cd $HOME/Miao-Yunzai
    git clone --depth=1 https://github.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
    pnpm install -P # 使用 pnpm 安装项目的依赖
    if [ ! -d "$HOME/Miao-Yunzai/" ]; then # 如果没有克隆成功
        echo "克隆失败"
        exit 0 # 退出脚本
    else # 如果克隆成功
        echo -e "\e[1;31m克隆完成\e[0m"
    fi
  else # 如果已经存在 Yunzai-Bot 文件夹，则不再克隆项目
    echo -e "\e[1;31m已检测到Miao-Yunzai\e[0m"
    echo -e "\e[1;31m正在检测nodejs是否安装...\e[0m"
    if node -v > /dev/null 2>&1; then
      echo -e "\e[1;31m已安装nodejs，正在检测版本是否小于16...\e[0m"
      node_version=$(node -v)
      if [ "$(echo "$node_version 16" | awk '{print ($1 < $2)}')" -eq 1 ]; then
        echo -e "\e[1;31m软件nodejs版本小于16，开始为您升级...\e[0m"
        apt remove nodejs
        apt remove libnode72
        apt-get update && apt-get install -y ca-certificates curl gnupg
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
        NODE_MAJOR=20
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
        apt-get update && apt-get install nodejs -y
      else
        echo -e "\e[1;31m版本大于等于16，继续\e[0m"
      fi
    else
      echo -e "\e[1;31m你根本没安装nodejs，开始为您安装...\e[0m"
      apt-get update && apt-get install -y ca-certificates curl gnupg
      curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
      NODE_MAJOR=20
      echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
      apt-get update && apt-get install nodejs -y
    fi
    echo -e "\e[1;31m开始检测是否安装Miao-Plugin...\e[0m"
    if [ ! -d "$HOME/Miao-Yunzai/plugins/miao-plugin" ]; then
        echo -e "\e[1;31m检测到你没有安装Miao-Plugin，开始安装...\e[0m"
        cd $HOME/Miao-Yunzai
        git clone --depth=1 https://github.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
        pnpm install -P
    else # 如果有miao-plugin
        echo -e "\e[1;31m防止没有安装依赖，就再执行一次吧\e[0m"
        pnpm install -P
    fi
fi
echo "如果大概应该没错没错的话应该部署完成了，5秒后返回脚本"
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/miao-menu.sh)