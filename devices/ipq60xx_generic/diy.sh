#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))


sed -i "/CONFIG_KERNEL_/d" .config

rm -rf devices/common/patches/{fix.patch,targets.patch} package/network/config/netifd package/feeds/kiddin9/rtl* target/linux/generic/files

svn co https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/package/network/config/netifd package/network/config/netifd
rm -rf package/network/config/netifd/patches

sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2099-12-06/" package/network/config/netifd/Makefile

rm -rf toolchain/musl

svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/toolchain/musl toolchain/musl
#ln -sf $(pwd)/feeds/luci/modules/luci-base package/feeds/kiddin9/
