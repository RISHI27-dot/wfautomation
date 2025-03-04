#!/bin/bash

mount_point=$1 # /media/rishikesh/
output=$2 # ~/ti-linux-kernel/build
task=$3 #Image | dt | modules

root=$mount_point/rootfs
boot=$mount_point/BOOT

# Notif user
if [ -d "$boot" ]; then
  echo "Valid SD card found..."
else
   echo "SD card not found"
   exit 1
fi

# Install everything by default
if [[ -z "$task" ]]; then
  echo "Installing dtbs Image modules"
  sudo cp $output/arch/arm64/boot/Image \
    $root/boot
  # To remove stale dtb and dtbo
  sudo rm $root/boot/dtb/ti/*.dtb && sudo rm $root/boot/dtb/ti/*.dtbo
  sudo cp $output/arch/arm64/boot/dts/ti/*.dtb $output/arch/arm64/boot/dts/ti/*.dtbo \
    $root/boot/dtb/ti/
  sudo make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=$output \
    INSTALL_MOD_PATH=$root modules_install
  sync
  exit
fi

# Check valid action is entered
if [[ $task == "Image" || $task == "dt" || $task == "modules" ]]; then
  echo "Installing $task..."
else
  echo "Enter valid action"
  echo "Valid actions: Image | dt | modules"
  exit
fi

# Copy the Image
if [[ $task == "Image" ]]; then
  sudo cp $output/arch/arm64/boot/Image \
    $root/boot
fi

# Copy the dt
if [[ $task == "dt" ]]; then
  sudo cp $output/arch/arm64/boot/dts/ti/*.dtb $output/arch/arm64/boot/dts/ti/*.dtbo \
    $root/boot/dtb/ti/
fi

# Install Modules
if [[ $task == "modules" ]]; then
  sudo make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=$output \
    INSTALL_MOD_PATH=$root modules_install
fi

sync

