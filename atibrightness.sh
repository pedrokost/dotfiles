#!/bin/bash
bvalue=`aticonfig --query-dispattrib=lvds,brightness|cut -d "," -f2|cut -d ":" -f2`

step=10
case $1 in
	inc)
		# Let us increase the brightness
		val=${2:-$step}
		bvalue=$((bvalue+val))
		aticonfig --set-dispattrib=lvds,brightness:$bvalue
		exit
		;;
	dec)
		# This is for decreasing the brightness
		val=${2:-$step}
		bvalue=$((bvalue-val))
		aticonfig --set-dispattrib=lvds,brightness:$bvalue
		exit
		;;
	set)
		# This is just for setting the brightness
		aticonfig --set-dispattrib=lvds,brightness:$2
		exit
		;;
	*)
		echo “That option is not recognized”
		;;
esac