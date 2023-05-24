#!/bin/bash

# Clone source code
latest_release="$(curl -s https://api.github.com/repos/openwrt/openwrt/tags | grep -Eo "v22.03.+[0-9\.]" | head -n 1)"
git clone --single-branch -b ${latest_release} https://github.com/openwrt/openwrt openwrt_release
git clone --single-branch -b openwrt-22.03 https://github.com/openwrt/openwrt openwrt
rm -f ./openwrt/include/version.mk
rm -f ./openwrt/include/kernel.mk
rm -f ./openwrt/include/kernel-5.10
rm -f ./openwrt/include/kernel-version.mk
rm -f ./openwrt/include/toolchain-build.mk
rm -f ./openwrt/include/kernel-defaults.mk
rm -f ./openwrt/package/base-files/image-config.in
rm -rf ./openwrt/target/linux/*
rm -rf ./openwrt/package/kernel/linux/*
cp -f ./openwrt_release/include/version.mk ./openwrt/include/version.mk
cp -f ./openwrt_release/include/kernel.mk ./openwrt/include/kernel.mk
cp -f ./openwrt_release/include/kernel-5.10 ./openwrt/include/kernel-5.10
cp -f ./openwrt_release/include/kernel-version.mk ./openwrt/include/kernel-version.mk
cp -f ./openwrt_release/include/toolchain-build.mk ./openwrt/include/toolchain-build.mk
cp -f ./openwrt_release/include/kernel-defaults.mk ./openwrt/include/kernel-defaults.mk
cp -f ./openwrt_release/package/base-files/image-config.in ./openwrt/package/base-files/image-config.in
cp -f ./openwrt_release/version ./openwrt/version
cp -f ./openwrt_release/version.date ./openwrt/version.date
cp -rf ./openwrt_release/target/linux/* ./openwrt/target/linux/
cp -rf ./openwrt_release/package/kernel/linux/* ./openwrt/package/kernel/linux/

# Clone packages
git clone -b master --depth 1 https://github.com/immortalwrt/immortalwrt.git immortalwrt
git clone -b openwrt-21.02 --depth 1 https://github.com/immortalwrt/immortalwrt.git immortalwrt_21
git clone -b master --depth 1 https://github.com/immortalwrt/packages.git immortalwrt_pkg
git clone -b master --depth 1 https://github.com/immortalwrt/luci.git immortalwrt_luci
git clone -b master --depth 1 https://github.com/coolsnowwolf/lede.git lede
git clone -b master --depth 1 https://github.com/coolsnowwolf/packages.git lede_pkg
git clone -b master --depth 1 https://github.com/coolsnowwolf/luci.git lede_luci
git clone -b master --depth 1 https://github.com/openwrt/openwrt.git openwrt_ma
git clone -b main --depth 1 https://github.com/openwrt/packages.git openwrt_pkg_ma
git clone -b main --depth 1 https://github.com/openwrt/luci.git openwrt_luci_ma
git clone -b master --depth 1 https://github.com/QiuSimons/OpenWrt-Add.git OpenWrt-Add

exit 0
