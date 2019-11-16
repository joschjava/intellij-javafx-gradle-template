#!/bin/bash
firefox=$(pactl list sink-inputs | grep Firefox -B 30 | grep "Sink Input #" | sed 's/[^0-9]*//g')
spotifysplit=$(pacmd list-sink-inputs | grep "Loopback from Monitor of SpotifySplit" -B 20 | grep Virtual2 -B 8 | grep index: | sed 's/[^0-9]*//g')
pactl set-sink-input-mute $firefox 1
pactl set-sink-input-mute $spotifysplit 0
