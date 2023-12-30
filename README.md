<div align="center">

# Miao-Yunzai安装脚本（Ubuntu）

提供Ubuntu（支持电脑，除了tmoe额外脚本）系统的Miao-Yunzai的一键安装，整合了python和ffmpeg

[![star](https://gitee.com/paimon114514/termux-yunzai-cv-script/badge/star.svg?theme=dark)](https://gitee.com/paimon114514/termux-yunzai-cv-script/stargazers)
![Linux-Shell](https://img.shields.io/badge/-shell-eed718?style=flat&logo=javascript&logoColor=ffffff)
[![YunzaiBot](https://img.shields.io/badge/Yunzai-V3.0.0-black?style=flat&logo=dependabot)](https://gitee.com/Le-niao/Yunzai-Bot)

[![访问量](https://profile-counter.glitch.me/termux-yunzai-cv-script/count.svg)](https://gitee.com/paimon114514/termux-yunzai-cv-script)
</div>

由于原作者尚未注册Gitee，本人已经过原作者同意（Email:nb3502022@outlook.com）[（他的QQ）](https://ti.qq.com/open_qq/index2.html?url=mqqapi%3a%2f%2fuserprofile%2ffriend_profile_card%3fsrc_type%3dweb%26version%3d1.0%26source%3d2%26uin%3d904869137)，（他的QQ号904869137）将此脚本上传至本repo。

先刨坑，但也许会咕咕咕

**原作者**留言：脚本是业余时间乱写的，CV了一点，本人小白求大佬指导！

项目仅供学习交流使用，严禁用于任何商业用途和非法行为

<hr>

## 使用方法

### 1.安装Ubuntu（如果已经装好可跳过）
<details>
  <summary>安装并启动Ubuntu</summary>

> 环境准备：一台Arm64的Android手机，且安卓版本为7.0及以上

选择ZeroTermux下载线路下载

<div align="center">

**[线路1](https://d.icdown.club/repository/main/ZeroTermux/)** 

**[备用线路（提取码1145）](https://www.123pan.com/s/KHitVv-ZLsph.html)** 

</div>

选择 **最新版本的ZeroTermux** 下载，然后打开软件输入以下命令安装ubuntu

```
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list && apt update && apt upgrade
#更新过程会出现冲突，询问是否替换直接回车即可
apt install proot wget -y
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/ubuntu/install.sh)

./startubuntu.sh
#启动ubuntu
```
</details>

<details>
  <summary>Tmoe-Linux安装</summary>
<div align="center">

请查看 [教程视频](https://www.123pan.com/s/KHitVv-pCNph.html) （提取码1145）

[自建网盘线路（可能不稳定）](http://pan.htadiy.top:64114/%E6%95%99%E7%A8%8B/%E6%95%99%E7%A8%8B_%E6%96%B0%E7%89%88%E9%87%8D%E7%BD%AE.mp4)
</div>
</details>

### 2.使用脚本
<details>
  <summary>1.直接运行（适用于使用本脚本安装的系统）</summary>

 **进入系统后直接执行** 
```
bash miao-menu.sh

```
</details>
<details>
  <summary>2.curl方法（适用于Tmoe等其它Ubuntu系统）</summary>

请根据网络情况选择 Github 或 Gitee
请确保网络环境良好

 **进入系统后直接运行这些命令** 

```

# 使用 Github（更新可能不及时）

apt update
apt install curl -y
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/miao-menu.sh)


# 使用Gitee

apt update
apt install curl -y
bash <(curl -sL https://gitee.com/paimon114514/termux-yunzai-cv-script/raw/master/miao-menu.sh)

```

</details>

<hr>

## 启动云崽（首次启动需配置参数）

```
cd ~/Miao-Yunzai
node app
```

## 常见问题

Q：为什么电脑Ubuntu安装很慢？

A：可能是您没有将apt更换至国内镜像源，具体可参考[更换清华源](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu)
<hr>
Q：为什么nodejs没有安装成功，输入node显示不存在？

A：可能是因为您的网络问题，可以尝试是否可以访问[nodejs源码站](https://deb.nodesource.com/)
<hr>
Q：为什么安装ffmpeg/python时会出现WARNING？会影响安装吗？

A：出现WARNING基本上没有任何影响，直接让它安装完即可。
<hr>
Q：为什么安装ffmpeg/python时这么慢？

A：跟你的cpu性能有关，越好就编译的越快，安装的也快。

## 问题反馈
任何问题最好是先自己研究一下，再去Issues提问，如解决完后请把状态改为「已完成」
## 致谢

|                           Nickname                            | Contribution         |
| :-----------------------------------------------------------: | -------------------- |
|     [Miao-Yunzai](../../../../yoimiya-kokomi/Miao-Yunzai)     | 喵喵的 Miao-Yunzai   |
|  [渔火Arcadia](../../../../yhArcadia/Yunzai-Bot-plugins-index)  | 云崽插件来源   |
