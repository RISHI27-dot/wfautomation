#!/bin/bash

gst-launch-1.0 v4l2src device="/dev/video-ov5640-cam0" ! video/x-raw, width=640, height=480, format=UYVY ! queue ! kmssink driver-name=tidss plane-properties=s,zpos=1
