#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

rm -rf target/linux/feeds
mv -f ipq807x_v5.4/ipq60xx target/linux/ipq60xx

rm -rf package/feeds
./scripts/feeds install -a -p ipq807x -f
./scripts/feeds install -a -p kiddin9 -f
./scripts/feeds install -a

sed -i "/CONFIG_KERNEL_/d" .config

#sed -i "/KernelPackage,ipt-nat6/d" package/feeds/ipq807x/linux/modules/netfilter.mk

echo "
CONFIG_FEED_ipq807x=n
" >> .config

 rm -rf devices/common/patches/mt7922.patch
 
rm -rf package/feeds/kiddin9/my-default-settings/files/etc/profile.d/sysinfo.sh

sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2099-12-06/" package/feeds/ipq807x/hostapd/Makefile
sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2099-12-06/" package/network/config/netifd/Makefile
sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2099-12-06/" package/system/procd/Makefile
sed -i "s/ath5k ath6kl ath6kl-sdio ath6kl-usb ath9k ath9k-common ath9k-htc ath10k //" package/feeds/ipq807x/mac80211/ath.mk

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += wireless-regdb ethtool kmod-sched-cake wpad-openssl/' target/linux/ipq60xx/Makefile


sed -i "/KernelPackage,crypto-aead/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,br-netfilter/d" package/kernel/linux/modules/netfilter.mk
sed -i "/KernelPackage,nf-conncount/d" package/kernel/linux/modules/netfilter.mk
sed -i "/KernelPackage,nf-socket/d" package/kernel/linux/modules/netfilter.mk
sed -i "/KernelPackage,ipt-conntrack/d" package/kernel/linux/modules/netfilter.mk
sed -i "/KernelPackage,ipt-filter/d" package/kernel/linux/modules/netfilter.mk
sed -i "/KernelPackage,ipt-ipopt/d" package/kernel/linux/modules/netfilter.mk
sed -i "/KernelPackage,ipt-ipsec/d" package/kernel/linux/modules/netfilter.mk
sed -i "/KernelPackage,nf-conntrack/d" package/kernel/linux/modules/netfilter.mk
sed -i "/KernelPackage,nft-tproxy/d" package/kernel/linux/modules/netfilter.mk
sed -i "/KernelPackage,can/d" package/kernel/linux/modules/can.mk
sed -i "/KernelPackage,crypto-chacha20poly1305/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-crc32/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-cts/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-ecdh/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-essiv/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-fcrypt/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-xcbc/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-md4/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-md5/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-misc/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-pcbc/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,crypto-test/d" package/kernel/linux/modules/crypto.mk
sed -i "/KernelPackage,lib-raid6/d" package/kernel/linux/modules/lib.mk
sed -i "/KernelPackage,lib-xor/d" package/kernel/linux/modules/lib.mk
sed -i "/KernelPackage,lib-crc*/d" package/kernel/linux/modules/lib.mk
sed -i "/KernelPackage,lib-842/d" package/kernel/linux/modules/lib.mk
sed -i "/KernelPackage,lib-textsearch/d" package/kernel/linux/modules/lib.mk
sed -i "/KernelPackage,lib-cordic/d" package/kernel/linux/modules/lib.mk
sed -i "/KernelPackage,firewire/d" package/kernel/linux/modules/firewire.mk
sed -i "/KernelPackage,fs-xfs/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-9p/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-autofs4/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-btrfs/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-cifs/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-cramfs/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-f2fs/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-fscache/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-hfs/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-isofs/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-jfs/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-minix/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-vfat/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-msdos/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-nfs*/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-ntfs*/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-reiserfs/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fs-udf/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,fuse/d" package/kernel/linux/modules/fs.mk
sed -i "/KernelPackage,9pnet/d" package/kernel/linux/modules/netsupport.mk
sed -i "/KernelPackage,dnsresolver/d" package/kernel/linux/modules/netsupport.mk
sed -i "/KernelPackage,mhi-bus/d" package/kernel/linux/modules/other.mk
sed -i "/KernelPackage,keys-trusted/d" package/kernel/linux/modules/other.mk
sed -i "s/^\$(eval \$(call KernelPackage/# \$(eval \$(call KernelPackage/" package/kernel/linux/modules/netdevices.mk
sed -i "s/# \$(eval \$(call KernelPackage,wwan))/\$(eval \$(call KernelPackage,wwan))/" package/kernel/linux/modules/netdevices.mk
rm -rf package/kernel/linux/modules/nls.mk
rm -rf package/kernel/linux/modules/hwmon.mk
rm -rf package/kernel/linux/modules/i2c.mk
rm -rf package/kernel/linux/modules/iio.mk
rm -rf package/kernel/linux/modules/input.mk
rm -rf package/kernel/linux/modules/leds.mk
rm -rf package/kernel/linux/modules/block.mk

rm -rf feeds/kiddin9/{base-files,fullconenat-nft,oaf,rkp-ipid,shortcut-fe} package/feeds/packages/{v4l2loopback,ovpn-dco,libpfring,mdio-netlink,batman-adv,wireguard} package/kernel/{nat46,ath10k-ct,button-hotplug} package/feeds/ipq807x/{wireguard,batman-adv} package/kernel/mt76

sed -i "s/SUBTARGET:=generic/SUBTARGET:=ipq60xx_64/" target/linux/ipq60xx/generic/target.mk

mv -f target/linux/ipq60xx/generic target/linux/ipq60xx/ipq60xx_64

sed -i "s/SUBTARGETS:=generic /SUBTARGETS:=ipq60xx_64 /" target/linux/ipq60xx/Makefile
