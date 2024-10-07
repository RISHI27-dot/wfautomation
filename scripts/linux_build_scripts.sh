#!/bin/bash

# git stash
# git checkout required branch
# lmake-clean
# l-clmake
# lmake
# mkdir required dir
# cp build dir into required dir

type=$1
BRANCH=$2
linux_dir=$3

cd $linux_dir

git stash
git checkout $BRANCH

# Clean
#make -j16 ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu- mrproper

if [[ $type == "-u" ]]; then
  make -j16 defconfig ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu-
fi

if [[ $type == "-t" ]]; then
  echo "-t"
  #make -j16 defconfig ti_arm64_prune.config ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu-
fi

#make -j16 ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu-

# Prepare the destinatio directory and mkdir it
CURR_BRANCH=$(git branch --show-current)
CURR_HEAD=$(git show -s --format=%h HEAD)
# DEST_DIR = <branch name>-_-<commit id>
# Rules: If the branch name has a '/' in it then replace it with .
VALID_BRANCH=$(echo $BRANCH | sed 's/\//./')
DEST_DIR="$VALID_BRANCH-_-$CURR_HEAD"
FINAL_DIR=~/linux-builds/$DEST_DIR
mkdir $FINAL_DIR

# Copy the build directory in the destination directory
cp  $linux_dir/build $FINAL_DIR -r
