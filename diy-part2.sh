#!/bin/bash
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
rm -rf feeds/{luci,packages}/{applications,lang,net}/{luci-app-appfilter,luci-app-daed,luci-app-openclash,luci-app-passwall,luci-app-wechatpush,open-app-filter,golang,chinadns-ng,daed,dns2socks-rust,dns2socks,dns2tcp,geoview,hysteria,ipt2socks,microsocks,mosdns,naiveproxy,nikki,pdnsd,redsocks2,shadow-tls,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,sing-box,tcping,trojan-plus,trojan,tuic-client,v2ray-core,v2ray-geodata,v2ray-plugin,xray-core,xray-plugin}
git clone --depth 1 -b 26.x --single-branch https://github.com/sbwml/packages_lang_golang.git feeds/packages/lang/golang
