#!/bin/bash

board_ip=$1
output=$2

sudo rm -rf /tmp/mods/*
sudo make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=$output INSTALL_MOD_PATH=/tmp/mods/ modules_install
cd /tmp/mods/
sudo tar -cvjSf kernel_modules.tar.bz2 lib/
scp kernel_modules.tar.bz2 root@$board_ip:~/
