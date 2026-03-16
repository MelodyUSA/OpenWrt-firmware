#!/bin/bash

# 預設主題
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改主機名
sed -i 's/ImmortalWrt/Mi-R4A/g' package/base-files/files/bin/config_generate

# 修改預設 IP
sed -i 's/192.168.1.1/192.168.1.31/g' package/base-files/files/bin/config_generate

# 修改預設 WiFi SSID
sed -i 's/ImmortalWrt/404.not.found.lab/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
