#!/bin/bash
#watch --interval 1 --no-title sh songtrack_logger.sh

songbefore="new"
while [ true ]
do
  spotifypid=$(pidof spotify | awk '{print $4}')
  song=$(wmctrl -p -l | grep $spotifypid | cut -d' ' -f 8-)
  if [ "$song" != "$songbefore" ]
	  then
		  datems=$(date +%s%3N)
		  echo "${datems};${song}" >> songs.txt
		  songbefore=$song
	  fi
  sleep 1
done
