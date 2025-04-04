#!/bin/bash

output=$1
board_ip=$2

~/wfautomation/scripts/sync_kernel.sh $output $board_ip
~/wfautomation/scripts/switchboard.sh 1
