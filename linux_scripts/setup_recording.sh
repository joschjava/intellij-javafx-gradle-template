#!/bin/bash
pactl load-module module-null-sink sink_name=Virtual1 sink_properties=device.description=Virtual1
pactl load-module module-null-sink sink_name=Virtual2 sink_properties=device.description=Virtual2
pactl load-module module-null-sink sink_name=SpotifySplit sink_properties=device.description=SpotifySplit
pactl load-module module-loopback latency_msec=1 sink=Virtual1 source=alsa_input.usb-046d_C922_Pro_Stream_Webcam_22DD9A6F-02.analog-stereo
pactl load-module module-loopback latency_msec=1 sink=Virtual1 source=SpotifySplit.monitor
pactl load-module module-loopback latency_msec=1 sink=Virtual2 source=SpotifySplit.monitor
pactl load-module module-loopback latency_msec=1 sink=0 source=Virtual2.monitor
pactl set-default-source Virtual1.monitor
pactl set-default-sink 1
