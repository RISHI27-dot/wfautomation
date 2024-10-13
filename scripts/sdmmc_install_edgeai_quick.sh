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
  cd ~/ti-linux-kernel/
  HEAD=$(git show -s --format=%h HEAD)
  MOD_DIR=""
  MOD_DIR_DIRTY=""
  val=0

  for dir in "/media/rishikesh/rootfs/lib/modules"/*; do
    TEMP_MOD_DIR=$(echo $dir | grep "$HEAD")
    TEMP_MOD_DIR_DIRTY=$(echo $TEMP_MOD_DIR | grep "dirty")

    if [[ -z $TEMP_MOD_DIR && -z $TEMP_MOD_DIR_DIRTY ]]; then
      echo "Note : Not picking $dir"
    else
      MOD_DIR=$TEMP_MOD_DIR
      MOD_DIR_DIRTY=$TEMP_MOD_DIR_DIRTY
      if [[ ! -z $MOD_DIR_DIRTY ]]; then
        echo "Note : Picking $dir"
      else
        echo "Note : Picking $dir"
      fi
    fi
  done

  if [[ -z "$MOD_DIR" ]]; then
    echo "WARNING : Fresh module install required !!"
    return 1
  fi

  if [[ -n "$(git diff --name-only)" && -z $MOD_DIR_DIRTY ]]; then
    echo "WARNING : dirty modules need to be installed, also check for build !!"
    return 1
  fi
  
  if [[ -z $MOD_DIR_DIRTY ]]; then
    sudo cp ~/ti-linux-kernel/build/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.ko \
      $MOD_DIR/kernel/drivers/media/platform/ti/j721e-csi2rx/
    echo " "
    echo "Installed CSI modules in $MOD_DIR"
  else
    sudo cp ~/ti-linux-kernel/build/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.ko \
      $MOD_DIR_DIRTY/kernel/drivers/media/platform/ti/j721e-csi2rx/
    echo " "
    echo "Installed CSI modules in $MOD_DIR_DIRTY"
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
