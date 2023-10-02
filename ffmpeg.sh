#!/bin/bash

current_user=$(whoami)

if [ "$current_user" != "root" ]; then
  echo "请使用root用户来使用此脚本！"
  exit 1
fi

echo "权限检查已通过！"
apt update
apt upgrade
apt install git
echo "正在从github获取ffmpeg..."
git clone https://github.com/FFmpeg/FFmpeg.git ~/ffmpeg
apt-get install zlib1g-dev libbz2-dev libssl-dev libncurses5-dev  libsqlite3-dev libreadline-dev tk-dev libgdbm-dev libdb-dev libpcap-dev xz-utils libexpat1-dev   liblzma-dev libffi-dev  libc6-dev
echo "正在安装依赖..."
apt install make
apt-get install libnuma-dev
apt install aptitude -y
aptitude install build-essential -y
aptitude install yasm nasm -y
apt-get install libgmp3-dev -y
apt install pkg-config -y
apt install gnutls-bin -y
aptitude install libaom-dev -y
aptitude install libass-dev -y
aptitude install libbluray-dev -y
aptitude install libfdk-aac-dev -y
aptitude install libmp3lame-dev -y
aptitude install libopencore-amrnb-dev -y
aptitude install libopencore-amrwb-dev -y
aptitude install libopenmpt-dev -y
aptitude install libopus-dev -y
aptitude install libshine-dev -y
aptitude install libsnappy-dev -y
aptitude install libsoxr-dev -y
aptitude install libspeex-dev -y
aptitude install libtheora-dev -y
aptitude install libtwolame-dev -y
aptitude install libvo-amrwbenc-dev -y
aptitude install llibvpx-dev -y
aptitude install libwavpack-dev -y
aptitude install libwebp-dev -y
aptitude install libx264-dev -y
aptitude install libx265-dev -y
aptitude install libxvidcore-dev -y
aptitude install liblzma-dev -y
echo "安装依赖库完成！开始配置安装...（配置时间较长，如没有文字显示，请耐心等待）"
cd $HOME/ffmpeg
./configure --prefix=/usr/local --pkg-config-flags=--static --enable-gpl --enable-version3 --enable-libass --enable-libbluray --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopus --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libtheora --enable-libtwolame --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxml2 --enable-lzma --enable-zlib --enable-gmp --enable-libvorbis --enable-libvo-amrwbenc --enable-libspeex --enable-libxvid --enable-libaom --enable-libopenmpt --enable-libfdk-aac --enable-nonfree
echo "配置安装完成！开始编译和安装（可能需要较长时间）"
cd $HOME/ffmpeg
make
cd $HOME/ffmpeg
make install
cd $HOME/ffmpeg
mv ffmpeg /usr/local/bin/
mv ffprobe /usr/local/bin/
echo "已安装完成ffmpeg，五秒后将退出脚本..."
for ((countdown=5; countdown>0; countdown--)); do
    echo "倒计时: $countdown"
    sleep 1
done
bash <(curl -sL https://raw.githubusercontent.com/htadiy/termux-yunzai-cv-script/main/miao-menu.sh)