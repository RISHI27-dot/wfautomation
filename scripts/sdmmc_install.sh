#!/bin/bash

mount_point=$1 # /media/rishikesh/
output=$2 # /build
task=$3 # Image | dt | modules

root=$mount_point/root
boot=$mount_point/boot

if [ -d "$boot" ]; then
  echo "Valid SD card found..."
else
   echo "SD card not found"
   exit
fi

#Install everyting by default
if [[ -z "$task" ]]; then
  echo "Installing dtbs Image modules"
  sudo cp $output/arch/arm64/boot/Image \
    $mount_point/root/boot
  sudo rm $mount_point/root/boot/dtb/ti/*.dtb
  sudo rm $mount_point/root/boot/dtb/ti/*.dtbo
  sudo cp $output/arch/arm64/boot/dts/ti/*.dtb $output/arch/arm64/boot/dts/ti/*.dtbo \
    $mount_point/root/boot/dtb/ti/
  sudo make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=$output \
    INSTALL_MOD_PATH=$mount_point/root modules_install
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
    $mount_point/root/boot
fi

# Copy the DT
if [[ $task == "dt" ]]; then
  sudo cp $output/arch/arm64/boot/dts/ti/*.dtb $output/arch/arm64/boot/dts/ti/*.dtbo \
    $mount_point/root/boot/dtb/ti/
fi

# Install the modules
if [[ $task == "modules" ]]; then
  sudo make -C /home/rishikesh/ti-linux-kernel/ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=$output \
    INSTALL_MOD_PATH=$mount_point/root modules_install
fi

# Sync
sync
