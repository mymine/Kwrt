#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))


sed -i "/CONFIG_KERNEL_/d" .config

rm -rf devices/common/patches/{fix.patch,targets.patch,kernel-defaults.patch,LINUX_VERSION.patch} target/imagebuilder package/network/config/netifd feeds/kiddin9/{rtl*,dnsmasq,fullconenat*,shortcut-fe,luci-base} target/linux/generic/files

svn co https://github.com/openwrt/openwrt/branches/openwrt-21.02/target/imagebuilder target/imagebuilder

sed -i "/libfakeroot/d" target/imagebuilder/Makefile

svn co https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/package/network/config/netifd package/network/config/netifd
rm -rf package/network/config/netifd/patches

sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2099-12-06/" package/network/config/netifd/Makefile

svn co https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/package/network/services/fullconenat feeds/kiddin9/fullconenat

rm -rf toolchain/musl package/libs/libselinux package/libs/libjson-c

svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/toolchain/musl toolchain/musl
svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/package/libs/libselinux package/libs/libselinux
svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/package/libs/libjson-c package/libs/libjson-c
svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/package/utils/ucode package/utils/ucode
#ln -sf $(pwd)/feeds/luci/modules/luci-base package/feeds/kiddin9/
