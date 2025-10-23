#!/bin/bash

shopt -s extglob

git_clone_path master https://github.com/coolsnowwolf/lede target/linux/amlogic package/boot/uboot-amlogic

sed -i "s/autocore-arm/autocore/" target/linux/amlogic/Makefile



