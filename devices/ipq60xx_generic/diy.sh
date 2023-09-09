#!/bin/bash
shopt -s extglob

svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ipq60xx target/linux/ipq60xx
svn co https://github.com/coolsnowwolf/lede/branches/package/firmware/ath11k-firmware package/firmware/ath11k-firmware
svn co https://github.com/coolsnowwolf/lede/branches/package/firmware/ath11k-wifi package/firmware/ath11k-wifi
sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += kmod-ath11k-ahb ath11k-firmware-ipq6018 wpad-basic-mbedtls/' target/linux/ipq60xx/Makefile
make defconfig

svn co https://github.com/coolsnowwolf/lede/trunk/package/qca package/qca

sed -i "s/+kmod-pppoe/+kmod-pppoe +kmod-bonding/" package/qca/nss/qca-nss-clients-64/Makefile

rm -rf package/kernel/{qca-nss-dp,qca-ssdk}

sed -i "s/CONFIG_ALL_NONSHARED=y/CONFIG_ALL_NONSHARED=n/" .config
sed -i "s/CONFIG_ALL_KMODS=y/CONFIG_ALL_KMODS=n/" .config
make defconfig
sed -i "s/# CONFIG_ALL_NONSHARED is not set/CONFIG_ALL_NONSHARED=y/" .config


