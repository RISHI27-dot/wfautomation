#!/bin/bash

dev=$1

gst-launch-1.0 v4l2src io-mode=dmabuf-import device=/dev/video-imx219-cam$dev ! video/x-bayer,width=1920,height=1080,format=rggb ! tiovxisp sensor-name=SENSOR_SONY_IMX219_RPI dcc-isp-file=/opt/imaging/imx219/linear/dcc_viss_1920x1080.bin sink_0::dcc-2a-file=/opt/imaging/imx219/linear/dcc_2a_1920x1080.bin sink_0::device=/dev/v4l-imx219-subdev0 ! video/x-raw,format=NV12 ! queue ! kmssink driver-name=tidss plane-properties=s,zpos=1
