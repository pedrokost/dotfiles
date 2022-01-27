#!/bin/bash
directory="/home/$USER/Pictures/auto-screenshots/$(date -u +%Y-%V)/$(date -u +%Y-%m-%d)"
mkdir -p "$directory"
filename="$(date -u --iso-8601=seconds).png"
import -window root -resize 640 -filter Gaussian -define filter:sigma=1  "$directory/$filename"