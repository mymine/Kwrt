#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

rm -rf target/linux/feeds
mv -f ../feeds/ipq807x_v5.4/ipq60xx target/linux/ipq60xx

rm -rf package/feeds
./scripts/feeds install -a -p ipq807x -f
./scripts/feeds install -a -p wifi_ax -f
./scripts/feeds install -a -p kiddin9 -f
./scripts/feeds install -a

sed -i "/CONFIG_KERNEL_/d" .config

#sed -i "/KernelPackage,ipt-nat6/d" package/feeds/ipq807x/linux/modules/netfilter.mk

echo "
CONFIG_FEED_gl_feeds_common=n
CONFIG_FEED_ipq807x=n
CONFIG_FEED_wifi_ax=n
" >> .config

sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2099-12-06/" package/feeds/wifi_ax/hostapd/Makefile
sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2099-12-06/" package/network/config/netifd/Makefile
sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2099-12-06/" package/system/procd/Makefile
sed -i "s/PKG_NAME:=iw/PKG_NAME:=iw\nPKG_SOURCE_DATE:=2099-12-06/" package/network/utils/iw/Makefile

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += wireless-regdb ethtool wpad-basic-openssl/' target/linux/ipq60xx/Makefile

#rm -rf feeds/kiddin9/{rtl*,base-files,fullconenat-nft,mbedtls,oaf,shortcut-fe,fullconenat}
rm -rf feeds/kiddin9/base-files
#svn co https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/package/network/services/fullconenat feeds/kiddin9/fullconenat

#rm -rf package/kernel/{ath10k-ct,mt76,rtl8812au-ct}
#rm -rf feeds/packages/net/xtables-addons package/feeds/packages/{openvswitch,ksmbd} package/feeds/routing/batman-adv

#rm -rf package/kernel/exfat

#ln -sf $(pwd)/feeds/luci/modules/luci-base package/feeds/kiddin9/
