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


install_csi_mods() {
    MOD_DIR=$(~/wfautomation/scripts/get_uname_from_Image.sh)

    if [[ -d /media/rishikesh/rootfs/lib/modules/$MOD_DIR ]];then 
        sudo cp ~/ti-linux-kernel/build/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.ko \
          /media/rishikesh/rootfs/lib/modules/$MOD_DIR/kernel/drivers/media/platform/ti/j721e-csi2rx/
        echo " "
        echo "Installed CSI modules in $MOD_DIR"
    else
        echo "Fresh module install required !!!"
        exit 1
    fi
}

# Install everything by default
if [[ -z "$task" ]]; then
  echo "Installing dtbs Image | only relevant modules"
  sudo cp $output/arch/arm64/boot/Image \
    $root/boot
  sudo cp $output/arch/arm64/boot/dts/ti/*.dtb $output/arch/arm64/boot/dts/ti/*.dtbo \
    $root/boot/dtb/ti/

  install_csi_mods
  ret=$?

  if [[ -n $ret ]]; then
    sync
    exit 
  else
    echo "Note: Won't reboot for liefr"
    exit 1
  fi
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

# Install relevant Modules
if [[ $task == "modules" ]]; then
  install_csi_mods
fi

sync
