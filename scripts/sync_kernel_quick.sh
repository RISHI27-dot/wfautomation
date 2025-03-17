#!/bin/bash

board_ip=$1
output=~/ti-linux-kernel/build/

MOD_DIR=$(~/wfautomation/scripts/get_uname_from_Image.sh)

echo "Installed:"

# Image
scp $output/arch/arm64/boot/Image root@$board_ip:/boot/

# # DTBS
# scp $output/arch/arm64/boot/dts/ti/*am62a* root@$board_ip:/boot/dtb/ti

# Install the CSI modules
scp $output/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.ko root@$board_ip:/lib/modules/$MOD_DIR/kernel/drivers/media/platform/ti/j721e-csi2rx/
scp $output/drivers/media/platform/cadence/cdns-csi2rx.ko root@$board_ip:/lib/modules/$MOD_DIR/kernel/drivers/media/platform/cadence/
scp $output/drivers/media/i2c/ov2312.ko root@$board_ip:/lib/modules/$MOD_DIR/kernel/drivers/media/i2c/

# Sync
ssh root@$board_ip 'sync'

