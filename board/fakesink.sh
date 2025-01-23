#!/bin/bash

GST_DEBUG=*v4l2*:7 GST_DEBUG_FILE="/run/fps_fakevideosink.txt" gst-launch-1.0 \
v4l2src device=/dev/video-imx219-cam0 name=v4l2_1 io-mode=5 ! queue max-size-buffers=1 leaky=2 ! video/x-bayer,width=1920,height=1080,framerate=30/1,format=rggb ! \
tiovxisp sink_0::device=/dev/v4l-imx219-subdev0 sensor-name=SENSOR_SONY_IMX219_RPI dcc-isp-file=/opt/imaging/imx219/linear/dcc_viss_1920x1080.bin \
sink_0::dcc-2a-file=/opt/imaging/imx219/linear/dcc_2a_1920x1080.bin format-msb=7 ! \
video/x-raw,format=NV12, width=1920,height=1080 ! queue ! fpsdisplaysink name=vs_1 video-sink=fakevideosink text-overlay=false sync=false -v \
v4l2src device=/dev/video-imx219-cam1 name=v4l2_2 io-mode=5 ! queue max-size-buffers=1 leaky=2 ! video/x-bayer,width=1920,height=1080,framerate=30/1,format=rggb ! \
tiovxisp sink_0::device=/dev/v4l-imx219-subdev1 sensor-name=SENSOR_SONY_IMX219_RPI dcc-isp-file=/opt/imaging/imx219/linear/dcc_viss_1920x1080.bin \
sink_0::dcc-2a-file=/opt/imaging/imx219/linear/dcc_2a_1920x1080.bin format-msb=7 ! \
video/x-raw,format=NV12, width=1920,height=1080 ! queue ! fpsdisplaysink name=vs_2 video-sink=fakevideosink text-overlay=false sync=false -v \
v4l2src device=/dev/video-imx219-cam2 name=v4l2_3 io-mode=5 ! queue max-size-buffers=1 leaky=2 ! video/x-bayer,width=1920,height=1080,framerate=30/1,format=rggb ! \
tiovxisp sink_0::device=/dev/v4l-imx219-subdev2 sensor-name=SENSOR_SONY_IMX219_RPI dcc-isp-file=/opt/imaging/imx219/linear/dcc_viss_1920x1080.bin \
sink_0::dcc-2a-file=/opt/imaging/imx219/linear/dcc_2a_1920x1080.bin format-msb=7 ! \
video/x-raw,format=NV12, width=1920,height=1080 ! queue ! fpsdisplaysink name=vs_3 video-sink=fakevideosink text-overlay=false sync=false -v \
v4l2src device=/dev/video-imx219-cam3 name=v4l2_4 io-mode=5 ! queue max-size-buffers=1 leaky=2 ! video/x-bayer,width=1920,height=1080,framerate=30/1,format=rggb ! \
tiovxisp sink_0::device=/dev/v4l-imx219-subdev3 sensor-name=SENSOR_SONY_IMX219_RPI dcc-isp-file=/opt/imaging/imx219/linear/dcc_viss_1920x1080.bin \
sink_0::dcc-2a-file=/opt/imaging/imx219/linear/dcc_2a_1920x1080.bin format-msb=7 ! \
video/x-raw,format=NV12, width=1920,height=1080 ! queue ! fpsdisplaysink name=vs_4 video-sink=fakevideosink text-overlay=false sync=false -v
