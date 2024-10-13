#!/bin/bash

board_ip=$1

~/wfautomation/scripts/sync_kernel_quick.sh $board_ip
~/wfautomation/scripts/switchboard.sh 1
