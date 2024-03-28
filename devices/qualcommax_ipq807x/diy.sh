#!/bin/bash
shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

bash $SHELL_FOLDER/../common/kernel_6.1.sh

rm -rf package/kernel/qca-nss-dp package/kernel/qca-ssdk devices/common/patches/rootfstargz.patch

git_clone_path master https://github.com/openwrt/openwrt target/linux/qualcommax

git_clone_path master https://github.com/coolsnowwolf/lede package/qca