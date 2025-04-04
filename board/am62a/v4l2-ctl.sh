#!/bin/bash

v4l2-ctl --stream-mmap -v width=1600,height=1300,pixelformat=BGI0 -d4 --stream-count=100 --verbose & v4l2-ctl --stream-mmap -v width=1600,height=1300,pixelformat=BGI0 -d5 --stream-count=100 --verbose
