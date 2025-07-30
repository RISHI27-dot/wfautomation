#!/bin/bash

edgeai_rc=$1
coresdk_rc=$2
platform=am62axx
release=$3

# TODO : split release inot major and minor release version since the path accept it in the form of major_minor form and not major.minor form

if [[ -z "$edgeai_rc" || -z "$coresdk_rc" || -z "$release" ]]; then
  cat <<EOF
Usage:
      wie <edgeai_rc> <coresdk_rc> <release>
EOF

  cat <<EOF
Options:
      coresdk_rc  :     1, 2, ....
      edgeai_rc   :     1, 2, ....
      release     :     11.01 ...
EOF
  exit
fi

D="/home/rishikesh/Desktop/$release-images"

wget -P $D/edgeai-rc$edgeai_rc http://swubn04.india.englab.ti.com/smpusdk-internal-release/11_01_0$coresdk_rc\_0$edgeai_rc/yocto/am62axx-evm/tisdk-edgeai-image-am62a-evm-$release.0$coresdk_rc.0$edgeai_rc.rootfs.wic.xz
cd $D/edgeai-rc$edgeai_rc
unxz -v -T 0 tisdk-edgeai-image-am62a-evm-$release.0$coresdk_rc.0$edgeai_rc.rootfs.wic.xz
