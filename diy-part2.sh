#!/bin/bash

# 1. 修改預設 IP (推薦，避免與光貓 192.168.1.1 衝突)
sed -i 's/192.168.1.1/192.168.1.101/g' package/base-files/files/bin/config_generate

# 2. 修改 .config 加入官方源中的套件
cat >> .config <<EOF
# 介面語言：簡體中文
CONFIG_LUCI_LANG_zh_Hans=y
CONFIG_PACKAGE_luci-i18n-base-zh-cn=y

# 主題：Argon
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_PACKAGE_luci-i18n-argon-config-zh-cn=y

# 工具：ttyd
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-i18n-ttyd-zh-cn=y

# 代理：OpenClash
CONFIG_PACKAGE_luci-app-openclash=y

# 代理：Nikki (ImmortalWrt 官方源名稱通常為 luci-app-nikki)
CONFIG_PACKAGE_luci-app-nikki=y

# 關鍵：移除基礎 dnsmasq，改用 dnsmasq-full (否則 OpenClash/Nikki 會報錯)
CONFIG_PACKAGE_dnsmasq=n
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y

# Turbo ACC 網路加速
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-i18n-turboacc-zh-cn=y
CONFIG_PACKAGE_kmod-tcp-bbr=y

# 無線驅動 (僅當你有外接 USB 網卡時需要)
CONFIG_PACKAGE_kmod-ath10k=y
CONFIG_PACKAGE_kmod-mt76=y

# 系統管理插件
CONFIG_PACKAGE_luci-app-advancedplus=y
CONFIG_PACKAGE_luci-app-fan=y
CONFIG_PACKAGE_luci-app-fileassistant=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-wizard=y

# 核心工具 (確保 BBR 加速和核心監控)
CONFIG_PACKAGE_kmod-tcp-bbr=y
CONFIG_PACKAGE_autocore-arm=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_nano=y
EOF
