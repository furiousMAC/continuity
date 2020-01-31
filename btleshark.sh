#!/bin/bash
PIPE=/tmp/ble_pipe
if [ -p $PIPE ] ; then
    rm $PIPE
fi
mkfifo $PIPE
ubertooth-btle -f -q $PIPE &
wireshark -ni $PIPE -k -w $(date +%Y%m%d-%H%M%S)-ble.pcapng
