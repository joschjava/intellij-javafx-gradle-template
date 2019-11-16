#!/bin/bash
index=$(pacmd list-sources | grep "HDA Intel PCH" -B 30 | grep "index" | tail -1 | sed 's/[^0-9]*//g')
pacmd set-source-mute $index 0
