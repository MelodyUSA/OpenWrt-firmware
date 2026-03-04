# ImmortalWrt For R3S
基於 [ImmortalWrt](https://github.com/immortalwrt/immortalwrt) 使用 GitHub Actions 線上編譯的 R3S 韌體

分支: v24.10.5

A template for building ImmortalWrt with GitHub Actions

## 說明
-  `.config` 定義目標硬體為 Nanopi R3S
-  `diy-part1.sh`：修改 feeds.conf（加入第三方倉庫）。
-  `diy-part2.sh`：修改配置預設和添加套件（改 IP、換主題、修改`.config`）。


包含套件: 
- OpenClash
- ttyd
- Argon Theme
- homeproxy
- Netdata
- SmartDNS
- WOL
- Turbo ACC
- SMB/CIFS 掛載

管理地址: 192.168.1.101

## Tips

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## Credits
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
