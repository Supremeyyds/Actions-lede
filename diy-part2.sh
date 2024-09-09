#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

rm -rf feeds/packages/net/adguardhome

rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang -b 1.22 feeds/packages/lang/golang

# Modify hostname
sed -i 's/OpenWrt/TWRT/g' package/base-files/files/bin/config_generate

sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='TWRT '/g" package/lean/default-settings/files/zzz-default-settings

wget https://raw.githubusercontent.com/Supremeyyds/Actions-lede/main/add_h28k_support.patch
git apply add_h28k_support.patch
rm package/feeds/luci/luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-serverchan
