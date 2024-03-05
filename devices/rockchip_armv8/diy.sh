#!/bin/bash

shopt -s extglob
SHELL_FOLDER=$(dirname $(readlink -f "$0"))

git_clone_path master https://github.com/coolsnowwolf/lede target/linux/generic/hack-6.1

rm -rf package/feeds/kiddin9/{quectel_Gobinet,quectel_MHI} devices/common/patches/kernel_version.patch devices/common/patches/rootfstargz.patch target/linux/generic/hack-6.1/{410-block-fit-partition-parser.patch,724-net-phy-aquantia*,720-net-phy-add-aqr-phys.patch}

curl -sfL https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/pending-6.1/613-netfilter_optional_tcp_window_check.patch -o target/linux/generic/pending-6.1/613-netfilter_optional_tcp_window_check.patch

rm -rf package/boot/uboot-rockchip package/boot/arm-trusted-firmware-rockchip

git_clone_path master https://github.com/coolsnowwolf/lede package/boot/uboot-rockchip
git_clone_path master https://github.com/coolsnowwolf/lede package/boot/arm-trusted-firmware-rockchip-vendor
git_clone_path master https://github.com/coolsnowwolf/lede package/boot/arm-trusted-firmware-rockchip

rm -rf target/linux/generic target/linux/rockchip/!(Makefile)

git_clone_path master https://github.com/coolsnowwolf/lede target/linux/generic
git_clone_path master https://github.com/coolsnowwolf/lede target/linux/rockchip

curl -sfL https://raw.githubusercontent.com/coolsnowwolf/lede/master/include/kernel-5.15 -o include/kernel-5.15

curl -sfL https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/kernel/linux/modules/video.mk -o package/kernel/linux/modules/video.mk

sed -i "/KernelPackage,ptp/d" package/kernel/linux/modules/other.mk

mv -f tmp/r8125 feeds/kiddin9/

rm -rf target/linux/rockchip/armv8/base-files/etc/uci-defaults/13_opkg_update

sed -i -e 's,kmod-r8168,kmod-r8169,g' target/linux/rockchip/image/armv8.mk

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += fdisk lsblk kmod-drm-rockchip/' target/linux/rockchip/Makefile

cp -Rf $SHELL_FOLDER/diy/* ./

echo '
CONFIG_SENSORS_PWM_FAN=y
' >> ./target/linux/rockchip/armv8/config-5.15
