#!/bin/bash

# 1. 修改預設 IP (推薦，避免與光貓 192.168.1.1 衝突)
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 2. 修改 .config 加入官方源中的套件
{
    # R3S 硬體目標
    echo "CONFIG_TARGET_rockchip=y"
    echo "CONFIG_TARGET_rockchip_armv8=y"
    echo "CONFIG_TARGET_rockchip_armv8_DEVICE_friendlyarm_nanopi-r3s=y"

    # 語言：簡體中文
    echo "CONFIG_LUCI_LANG_zh_Hans=y"
    echo "CONFIG_PACKAGE_luci-i18n-base-zh-cn=y"

    # 主題：Argon (ImmortalWrt 官方源自帶)
    echo "CONFIG_PACKAGE_luci-theme-argon=y"
    echo "CONFIG_PACKAGE_luci-app-argon-config=y"
    echo "CONFIG_PACKAGE_luci-i18n-argon-config-zh-cn=y"

    # 工具：ttyd (ImmortalWrt 官方源自帶)
    echo "CONFIG_PACKAGE_luci-app-ttyd=y"
    echo "CONFIG_PACKAGE_luci-i18n-ttyd-zh-cn=y"

    # 代理：OpenClash (ImmortalWrt 官方源通常有收錄)
    echo "CONFIG_PACKAGE_luci-app-openclash=y"

    # 代理：Nikki (ImmortalWrt 官方源最近已收錄)
    echo "CONFIG_PACKAGE_luci-app-nikki=y"

    # 必備相依性處理：強制使用 dnsmasq-full 以支援 OpenClash/Nikki
    echo "CONFIG_PACKAGE_dnsmasq=n"
    echo "CONFIG_PACKAGE_dnsmasq-full=y"
    echo "CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y"
} >> .config
