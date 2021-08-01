#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# Uncomment a feed source
# sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default
# sed -i 's/\"#src-git\"/\"src-git\"/g' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
rm -rf ../lean/luci-theme-argon
# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}
sed -i '$a src-git kenzok https://github.com/kenzok8/openwrt-packages' feeds.conf.default    # 常用插件源
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default                # 常用插件源_依赖安装
sed -i '$a src-git serverchan https://github.com/tty228/luci-app-serverchan' feeds.conf.defaul  # 信息推送
git clone https://github.com/jerrykuku/node-request.git package/lean/node-request  #京东签到依赖
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/lean/luci-app-jd-dailybonus  #京东签到

# Add luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git


# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# netdata汉化版
# pushd package/lean
# git clone --depth=1 https://github.com/sirpdboy/luci-app-netdata

# 删除默认插件
rm -rf ./feeds/luci/applications/luci-app-upnp
# rm -rf ./feeds/luci/applications/luci-app-wol
# rm -rf ./package/lean/wol
