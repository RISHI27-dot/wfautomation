#!/bin/bash

board_ip=$2
output=$1

# Image
scp $output/arch/arm64/boot/Image root@$board_ip:/boot/

# DTBS
# remove stale dtbs
ssh root@$board_ip 'sudo rm $/root/boot/dtb/ti/*.dtb'
ssh root@$board_ip 'sudo rm $/root/boot/dtb/ti/*.dtbo'
scp $output/arch/arm64/boot/dts/ti/* root@$board_ip:/boot/dtb/ti

# Modules
sudo rm -rf /tmp/mods/lib/modules/*
sudo make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=$output INSTALL_MOD_PATH=/tmp/mods modules_install
cd /tmp/mods/lib/modules/

sudo tar -cvjSf kernel_modules.tar.bz2 .
scp -r /tmp/mods/lib/modules/kernel_modules.tar.bz2 root@$board_ip:/mnt/
ssh root@$board_ip 'tar -xf /mnt/kernel_modules.tar.bz2 -C /lib/modules/'

# Sync
ssh root@$board_ip 'sync'
