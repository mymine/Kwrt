#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

rm -rf package/feeds/packages/libpfring package/feeds/packages/xr_usb_serial_common

git clone https://github.com/JiaY-shi/nss-packages.git package/nss-packages

rm -rf feeds/kiddin9/{fibocom_QMI_WWAN,quectel_Gobinet,shortcut-fe}
