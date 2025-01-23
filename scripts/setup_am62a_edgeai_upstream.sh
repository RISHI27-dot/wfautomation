#!/bin/bash

mount=/media/rishikesh

if [ -d "/media/rishikesh/BOOT" ]; then
  echo "Valid SD card found..."
else
   echo "SD card not found"
   exit 1
fi

# sudo cp ~/wfautomation/board/mosiac.sh $mount/rootfs/opt/edgeai-gst-apps/
# sudo cp ~/wfautomation/board/sim_hang_mosiac.sh $mount/rootfs/opt/edgeai-gst-apps/
# sudo cp $mount/rootfs/opt/edgeai-gst-apps/scripts/setup_cameras_v3link.sh $mount/rootfs/opt/edgeai-gst-apps/f.sh
# sudo cp ~/wfautomation/board/f_upstream.sh $mount/rootfs/opt/edgeai-gst-apps/
# sudo cp ~/wfautomation/board/uEnv.txt $mount/BOOT

# Backup v4l-utils and install new ones
sudo mv $mount/rootfs/usr/bin/media-ctl $mount/rootfs/usr/lib/media-ctl.backup
sudo cp ~/wfautomation/board/v4l-utils/media-ctl $mount/rootfs/usr/bin

sync

echo "Updated AM62A SD card for upstream"
