#!/bin/bash

board_ip=$1

~/wfautomation/scripts/sync_kernel_quick.sh $board_ip

ssh root@$board_ip 'rmmod /lib/modules/$(uname -r)/kernel/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.ko'
ssh root@$board_ip 'insmod /lib/modules/$(uname -r)/kernel/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.ko'
ssh root@$board_ip 'rmmod /lib/modules/$(uname -r)/kernel/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.ko'
ssh root@$board_ip 'insmod /lib/modules/$(uname -r)/kernel/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.ko'

ssh root@$board_ip '/opt/edgeai-gst-apps/f_hc.sh'
