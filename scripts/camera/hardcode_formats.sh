#!/bin/bash

##################### To be filled #########################################################

FORMAT=''
SHIM_ROUTING='[0/0 -> 2/0 [1], 0/1 -> 3/0 [1], 0/2 -> 4/0 [1], 0/3 -> 5/0 [1]]'
CDNS_CSI_RX_ROUTING='[0/0 -> 1/0 [1], 0/1 -> 1/1 [1], 0/2 -> 1/2 [1], 0/3 -> 1/3 [1]]'
UB960_ROUTING='[0/0 -> 4/0 [1], 1/0 -> 4/1 [1], 2/0 -> 4/2 [1], 3/0 -> 4/3 [1]]'
UB953_COMMON_ROUTING='[0/0 -> 1/0 [1]]'

SHIM='30102000.ticsi2rx'

CDNS_CSI_RX='cdns_csi2rx.30101000.csi-bridge'

UB960='ds90ub960 4-0030'

UB953_1='ds90ub953 4-0044'
UB953_2='ds90ub953 4-0045'
UB953_3='ds90ub953 4-0046'
UB953_4='ds90ub953 4-0047'

SENSOR_1='imx219 6-0010'
SENSOR_2='imx219 7-0010'
SENSOR_3='imx219 8-0010'
SENSOR_4='imx219 9-0010'

# Routing (Not using context 0)
#

media-ctl -R '"$SHIM" $SHIM_ROUTING'
media-ctl -R '"$CDNS_CSI_RX" $CDNS_CSI_RX_ROUTING'



