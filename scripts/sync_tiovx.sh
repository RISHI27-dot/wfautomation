#!/bin/bash

board_ip=$1
build=$2

# App
sudo cp ~/edgeai-tiovx-apps /tmp/apps/ -r
cd /tmp/apps
sudo tar -cvjSf edgeai_tiovx_apps.tar.bz2 .
scp -r /tmp/apps/edgeai_tiovx_apps.tar.bz2 root@$board_ip:/mnt/
ssh root@$board_ip 'tar -xf /mnt/edgeai_tiovx_apps.tar.bz2 -C /opt/'

# #Sync
ssh root@$board_ip 'sync'

