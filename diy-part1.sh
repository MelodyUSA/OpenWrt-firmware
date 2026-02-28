#!/bin/bash
#git clone --depth 1 -b beta --single-branch https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
git clone --depth 1 -b v5 --single-branch https://github.com/sbwml/openwrt_helloworld.git package/helloworld && rm -rf package/helloworld/{luci-app-homeproxy,lua-neturl}
git clone --depth 1 -b v5 --single-branch https://github.com/sbwml/luci-app-mosdns.git package/luci-app-mosdns
git clone --depth 1 -b master https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone --depth 1 -b main --single-branch https://github.com/sbwml/luci-app-openlist2.git package/luci-app-openlist2
git clone --depth 1 -b master https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush
