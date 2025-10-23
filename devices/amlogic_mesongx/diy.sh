#!/bin/bash

shopt -s extglob

git_clone_path master https://github.com/coolsnowwolf/lede target/linux/generic/backport-6.1 target/linux/generic/hack-6.1 target/linux/generic/pending-6.1 target/linux/amlogic package/boot/uboot-amlogic

sed -i "s/autocore-arm/autocore/" target/linux/amlogic/Makefile

wget -N https://github.com/coolsnowwolf/lede/raw/refs/heads/master/include/kernel-6.1 -P include/



