#!/bin/bash
fiveMinsAhead=$(date -v+5M +"%Y-%m-%dT%H:%M:%S%Z")
fiveMinsAheadJustTime=$(date -v+5M +"%l:%M %p")
currentTime=$(date +"%Y-%m-%dT%H:%M:%S%Z")

nextEvent=$(/usr/local/bin/icalBuddy -ic jerell.mendoza@semanticbits.com -iep location -f eventsFrom:$currentTime to:$fiveMinsAhead |  awk -F' ' '{print $NF}' | tail -n1 | tr -d "[:cntrl:]" | cut -d"[" -f 1)
nextEventJustTime=$(/usr/local/bin/icalBuddy -ic jerell.mendoza@semanticbits.com -iep datetime -f eventsFrom:$currentTime to:$fiveMinsAhead | tail -n1 | cut -d'-' -f1)

if [[ "$nextEventJustTime" == *"$fiveMinsAheadJustTime"* ]]; then
  echo "opening zoom event"
  echo $nextEvent
  open $nextEvent
fi
