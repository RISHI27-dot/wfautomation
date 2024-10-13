#!/bin/bash

sw_no=$1

if [[ -z $sw_no ]]; then
  echo "Usage : ./switchboard.sh <sw_no>"
fi

rst() {
  ssh admin@rido "uom set relay/outlets/$sw_no/state false" && \
  sleep 1 && \
  ssh admin@rido "uom set relay/outlets/$sw_no/state true"
}

rst

