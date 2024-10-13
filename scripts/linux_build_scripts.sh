#!/bin/bash

type=$1
linux_dir=$2
args_in=$@

branches=$(echo $args_in | tr " " "\n")
echo $branches
flag=0

for branch in $branches
do
  if [[ $flag == 1 ]]; then

    cd $linux_dir

    git checkout $branch

    make -j16 ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu- mrproper

    if [[ $type == "-l" ]]; then
      make -j16 defconfig ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu-
    fi

    if [[ $type == "-t" ]]; then
      echo "-t"
      make -j16 defconfig ti_arm64_prune.config ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu-
    fi

    make -j16 ARCH=arm64 O=build CROSS_COMPILE=aarch64-none-linux-gnu-

    CURR_BRANCH=$(git branch --show-current)
    CURR_HEAD=$(git show -s --format=%h HEAD)
    # DEST_DIR = <branch name>-_-<commit id>
    # Rules: If the branch name has a '/' in it then replace it with .
    VALID_BRANCH=$(echo $branch | sed 's/\//./')
    DEST_DIR="$VALID_BRANCH-_-$CURR_HEAD"
    FINAL_DIR=~/linux-builds/$DEST_DIR
    mkdir $FINAL_DIR

    cp  $linux_dir/build $FINAL_DIR -r
  fi

  if [[ $branch == "-b" ]]; then
     echo "building branches"
     flag=1
  fi
done
