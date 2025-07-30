#!/bin/bash

rc=$1
platform=$2
release=$3

if [[ -z "$rc" || -z "$platform" || -z "$release" ]]; then
  cat <<EOF
Usage:
      wi <rc> <platform> <release>
EOF

  cat <<EOF
Options:
      rc        :     1, 2, ....
      platform  :     am62axx, am62pxx, am62xx ...
      release   :     10.00, 10.01, 11.00, 11.01 ...
EOF
  exit
fi

D="/home/rishikesh/Desktop/$release-images"

wget -P $D/rc$rc http://lcpd.itg.ti.com/builds/arago-scarthgap/prod/$platform-evm/$release.0$rc/images/tisdk-default-image-$platform-evm.rootfs.wic.xz
cd $D/rc$rc
unxz -v -T 0 tisdk-default-image-$platform-evm.rootfs.wic.xz
