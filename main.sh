#!/bin/bash
fiveMinsAhead=$(date -v-5M +"%Y-%m-%dT%H:%M:%S%Z")
now=$(date +"%Y-%m-%dT%H:%M:%S%Z")

nextEvent=$(icalBuddy -ic jerell.mendoza@semanticbits.com -iep location -f eventsFrom:$now to:$fiveMinsAhead |  awk -F' ' '{print $NF}' | tail -n1 | tr -d "[:cntrl:]" | cut -d"[" -f 1)

echo $nextEvent

open $nextEvent
