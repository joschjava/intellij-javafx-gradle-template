# Linux commands 

## Create Recording environment

```
#!/bin/bash
pactl load-module module-null-sink sink_name=Virtual1 sink_properties=device.description=Virtual1
pactl load-module module-null-sink sink_name=Virtual2 sink_properties=device.description=Virtual2
pactl load-module module-loopback latency_msec=1 sink=Virtual1
pactl load-module module-loopback latency_msec=1 sink=Virtual1 source=Virtual2.monitor
pactl load-module module-loopback latency_msec=1 sink=0 source=Virtual2.monitor
pactl set-default-source Virtual1.monitor
pactl set-default-sink 1
```

## Set volume of specific program (Tab Playback in pavucontrol)
```
sinknr=$(pactl list sink-inputs | grep Firefox -B 30 | grep "Sink Input #" | sed 's/[^0-9]*//g')
pactl set-sink-input-volume $sinknr 80%
```

## Set preferences for Recording (Tab recording in pavucontrol)
```
virtual1=$(pacmd list-source-outputs | grep "Loopback to Virtual1" -B 22 | grep \<Virtual2.monitor\> -B 10 |  grep index | sed 's/[^0-9]*//g')
```