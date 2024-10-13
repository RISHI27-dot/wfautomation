#!/bin/bash

board_ip=$1
output=~/ti-linux-kernel/build/

modpath=$(ssh root@$board_ip 'uname -r')
echo "Installing CSI modules in the dir : $modpath"
echo " "
echo "WARNING : wont work if new commit made in tree !!!"
echo " "

# # Image
# scp $output/arch/arm64/boot/Image root@$board_ip:/boot/

# # DTBS
# scp $output/arch/arm64/boot/dts/ti/*am62a* root@$board_ip:/boot/dtb/ti

# Install the CSI modules
scp $output/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.ko root@$board_ip:/lib/modules/$modpath/kernel/drivers/media/platform/ti/j721e-csi2rx/

# Sync
ssh root@$board_ip 'sync'

