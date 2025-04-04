#!/bin/bash
dev=$1
v4l2-ctl --stream-mmap -v width=1600,height=1300,pixelformat=BGI0 -d$dev --verbose
