#!/bin/bash

board_ip=$1

# App
scp ~/edgeai-tiovx-apps/tests/app_tiovx_linux_multi_capture_display_test.c root@$board_ip:/opt/edgeai-tiovx-apps/tests/

echo "Updated app_tiovx_linux_multi_capture_display_test.c"

# #Sync
ssh root@$board_ip 'sync'

