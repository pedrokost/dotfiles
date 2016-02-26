#!/bin/bash

# export DISPLAY=:0.0

summary="$2"
body="$3"

echo "`date` $summary $body" >> "`pwd`/log_dunst_speak.log"

/bin/echo "$summary $body" | /usr/bin/espeak -v female3

