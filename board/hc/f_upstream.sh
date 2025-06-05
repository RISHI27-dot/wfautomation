#!/bin/bash

media-ctl -R '"ds90ub960 4-0030" [0/0 -> 4/0 [1], 1/0 -> 4/1 [1], 2/0 -> 4/2 [1], 3/0 -> 4/3 [1]]'
media-ctl -R '"cdns_csi2rx.30101000.csi-bridge" [0/0 -> 1/0 [1], 0/1 -> 1/1 [1], 0/2 -> 1/2 [1], 0/3 -> 1/3 [1]]'
media-ctl -R '"30102000.ticsi2rx" [0/0 -> 2/0 [1], 0/1 -> 3/0 [1], 0/2 -> 4/0 [1], 0/3 -> 5/0 [1]]'

media-ctl --set-v4l2 '"imx219 6-0010":0[fmt:SRGGB10_1X10/1920x1080]'
media-ctl --set-v4l2 '"imx219 7-0010":0[fmt:SRGGB10_1X10/1920x1080]'
media-ctl --set-v4l2 '"imx219 8-0010":0[fmt:SRGGB10_1X10/1920x1080]'
media-ctl --set-v4l2 '"imx219 9-0010":0[fmt:SRGGB10_1X10/1920x1080]'

media-ctl --set-v4l2 '"ds90ub953 4-0044":0[fmt:SRGGB10_1X10/1920x1080 field: none]'
media-ctl --set-v4l2 '"ds90ub953 4-0045":0[fmt:SRGGB10_1X10/1920x1080 field: none]'
media-ctl --set-v4l2 '"ds90ub953 4-0046":0[fmt:SRGGB10_1X10/1920x1080 field: none]'
media-ctl --set-v4l2 '"ds90ub953 4-0047":0[fmt:SRGGB10_1X10/1920x1080 field: none]'

media-ctl --set-v4l2 '"ds90ub960 4-0030":0/0 [fmt:SRGGB10_1X10/1920x1080 field: none]'
media-ctl --set-v4l2 '"ds90ub960 4-0030":1/0 [fmt:SRGGB10_1X10/1920x1080 field: none]'
media-ctl --set-v4l2 '"ds90ub960 4-0030":2/0 [fmt:SRGGB10_1X10/1920x1080 field: none]'
media-ctl --set-v4l2 '"ds90ub960 4-0030":3/0 [fmt:SRGGB10_1X10/1920x1080 field: none]'


media-ctl --set-v4l2 '"cdns_csi2rx.30101000.csi-bridge":0/0 [fmt:SRGGB10_1X10/1920x1080]'
media-ctl --set-v4l2 '"cdns_csi2rx.30101000.csi-bridge":0/1 [fmt:SRGGB10_1X10/1920x1080]'
media-ctl --set-v4l2 '"cdns_csi2rx.30101000.csi-bridge":0/2 [fmt:SRGGB10_1X10/1920x1080]'
media-ctl --set-v4l2 '"cdns_csi2rx.30101000.csi-bridge":0/3 [fmt:SRGGB10_1X10/1920x1080]'

media-ctl --set-v4l2 '"30102000.ticsi2rx":0/0 [fmt:SRGGB10_1X10/1920x1080]'
media-ctl --set-v4l2 '"30102000.ticsi2rx":0/1 [fmt:SRGGB10_1X10/1920x1080]'
media-ctl --set-v4l2 '"30102000.ticsi2rx":0/2 [fmt:SRGGB10_1X10/1920x1080]'
media-ctl --set-v4l2 '"30102000.ticsi2rx":0/3 [fmt:SRGGB10_1X10/1920x1080]'

v4l2-ctl -z platform:30102000.ticsi2rx -d "30102000.ticsi2rx context 1" -v width=1920,height=1080,pixelformat=RG10
v4l2-ctl -z platform:30102000.ticsi2rx -d "30102000.ticsi2rx context 2" -v width=1920,height=1080,pixelformat=RG10
v4l2-ctl -z platform:30102000.ticsi2rx -d "30102000.ticsi2rx context 3" -v width=1920,height=1080,pixelformat=RG10
v4l2-ctl -z platform:30102000.ticsi2rx -d "30102000.ticsi2rx context 4" -v width=1920,height=1080,pixelformat=RG10
