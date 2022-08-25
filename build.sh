#!/bin/bash
sudo rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc
sudo apt update
sudo apt install wget curl git tar zip unzip screen clang make bison flex python3-distutils swig python3-dev libssl-dev -y
sudo apt autoremove -y
sudo apt clean
sudo timedatectl set-timezone "$TZ"
sudo mkdir -p /yunbuilduboot
sudo chown $USER:$GROUPS /yunbuilduboot
cd /yunbuilduboot/
wget https://downloads.openwrt.org/snapshots/targets/ramips/mt7620/openwrt-toolchain-ramips-mt7620_gcc-11.3.0_musl.Linux-x86_64.tar.xz -O openwrt-toolchain-ramips-mt7620_gcc-11.3.0_musl.Linux-x86_64.tar.xz
tar -xvf openwrt-toolchain-ramips-mt7620_gcc-11.3.0_musl.Linux-x86_64.tar.xz
rm -rf openwrt-toolchain-ramips-mt7620_gcc-11.3.0_musl.Linux-x86_64.tar.xz
git clone --depth=1 -b youku-l1 https://github.com/openwrt2223/u-boot.git
export STAGING_DIR=/yunbuilduboot/openwrt-toolchain-ramips-mt7620_gcc-11.3.0_musl.Linux-x86_64/
export PATH=$STAGING_DIR/toolchain-mipsel_24kc_gcc-11.3.0_musl/bin:$PATH
cd u-boot
make CROSS_COMPILE=mipsel-openwrt-linux- mt7620_rfb_defconfig
make CROSS_COMPILE=mipsel-openwrt-linux-
echo "build u-boot done !"
ls -all
