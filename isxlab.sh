#!/usr/bin/env bash
xlab_hostname='pedro-xlab'
start_time=7
end_time=17

isweekday () {
	if [ $(date +%u) -lt 6 ] ; then
		return 0
	else
		return 1
	fi
}

isworkinghour () {
	TIME=$(date +%H)

	if [ $TIME -ge "$start_time" ] &&  [ $TIME -lt "$end_time" ]; then
		return 0
	else
		return 1
	fi
}

isxlab () {
	if [ `hostname -s` = $xlab_hostname ]; then
		return 0
	else
		return 1
	fi
}

# 0 means true, 1 means false
(isxlab && isweekday && isworkinghour)

