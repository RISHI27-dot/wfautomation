#!/bin/bash

board_ip=$1

# Modules
ssh root@$board_ip 'mkdir /opt/edgeai-tiovx-apps/build'
ssh root@board_ip 'cd /opt/edgeai-tiovx-apps/build && cmake .. && make -j2'
