#!/bin/bash

# 1. 修改預設 IP (推薦，避免與光貓 192.168.1.1 衝突)
sed -i 's/192.168.1.1/192.168.1.101/g' package/base-files/files/bin/config_generate

# 加入 chenmozhijin 的 TurboACC (官方推薦安裝方式)
# 這會自動下載插件並應用 firewall4 補丁，確保 FullCone NAT 正常工作
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe

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

# 加入 homeproxy/sing-box/Nikki 所需的內核依賴
CONFIG_PACKAGE_kmod-netlink-diag=y
CONFIG_PACKAGE_kmod-nft-tproxy=y
CONFIG_PACKAGE_kmod-tun=y
CONFIG_PACKAGE_kmod-nft-socket=y
CONFIG_PACKAGE_kmod-dummy=y

# 確保 Nikki 及其語言包被編譯進韌體
CONFIG_PACKAGE_luci-app-nikki=y
CONFIG_PACKAGE_luci-i18n-nikki-zh-cn=y

# 如果你還想要 Homeproxy，也順便補上它的依賴（選用）
CONFIG_PACKAGE_kmod-netlink-diag=y
# 確保 sing-box 相關組件正確
CONFIG_PACKAGE_sing-box=y
CONFIG_PACKAGE_luci-app-homeproxy=y
CONFIG_PACKAGE_luci-i18n-homeproxy-zh-cn=y

# 關鍵：移除基礎 dnsmasq，改用 dnsmasq-full (否則 OpenClash/Nikki 會報錯)
CONFIG_PACKAGE_dnsmasq=n
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y

# Turbo ACC 網路加速
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-i18n-turboacc-zh-cn=y

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

# 修改根分區大小
# 建議設為 960 或 1024
echo "CONFIG_TARGET_ROOTFS_PARTSIZE=1024" >> .config

# 修改內核分區大小
echo "CONFIG_TARGET_KERNEL_PARTSIZE=64" >> .config
