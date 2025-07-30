#!/bin/bash

mode=$1
ip=$2

if [[ $mode == "-mmc" ]]; then

  # Notif user
  if [ -d "/media/rishieksh/boot" ]; then
    echo "Valid SD card found..."
  else
    echo "SD card not found"
    exit 1
  fi

  #setupcamera.sh
  cp ~/ltp-ddt/testcases/ddt/scripts/common/setupcamera.sh \
    media/rishikesh/root/opt/ltp/testcases/bin/ddt/common/
  #multicamera_gstreamer.sh
  cp ~/ltp-ddt/testcases/ddt/scripts/common/multicamera_gstreamer.sh \
    media/rishieksh/root/opt/ltp/testcases/bin/ddt/common/
  #csi_capture_tests
  cp ~/ltp-ddt/runtest/ddt/csi_capture_tests \
    /media/rishikesh/root/opt/ltp/runtest/ddt
fi

if [[ $mode == "-scp" ]]; then
  #setupcamera.sh
  scp ~/ltp-ddt/testcases/ddt/scripts/common/setupcamera.sh \
    root@$ip:/opt/ltp/testcases/bin/ddt/common/
  #multicamera_gstreamer.sh
  scp ~/ltp-ddt/testcases/ddt/scripts/common/multicamera_gstreamer.sh \
    root@$ip:/opt/ltp/testcases/bin/ddt/common/
  #csi_capture_tests
  scp ~/ltp-ddt/runtest/ddt/csi_capture_tests \
    root@$ip:/opt/ltp/runtest/ddt
fi
