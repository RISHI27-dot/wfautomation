#!/bin/bash

board_ip=$1
output=~/ti-linux-kernel/build/

# Image
scp $output/arch/arm64/boot/Image root@$board_ip:/boot/

# DTBS
scp $output/arch/arm64/boot/dts/ti/* root@$board_ip:/boot/dtb/ti

# Modules
sudo rm -rf /tmp/mods/*
sudo make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=$output INSTALL_MOD_PATH=/tmp/mods modules_install
cd /tmp/mods/
sudo tar -cvjSf kernel_modules.tar.bz2 lib/
scp -r /tmp/mods/kernel_modules.tar.bz2 root@$board_ip:/mnt/
ssh root@$board_ip 'tar -xf /mnt/kernel_modules.tar.bz2 -C /'

# Sync
ssh root@$board_ip 'sync'

