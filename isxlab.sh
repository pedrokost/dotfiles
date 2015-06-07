#!/usr/bin/env bash
xlab_hostname='pedro-xlab'
start_time=7
end_time=17

isweekday () {
	if [[ $(date +%u) -lt 6 ]] ; then
		return 1
	else
		return 0
	fi
}

isworkinghour () {
	TIME=$(date +%H)

	if [ $TIME -ge "$start_time" ] &&  [ $TIME -lt "$end_time" ]; then
		return 1
	else
		return 0
	fi
}

isxlab () {
	if [[ `hostname -s` = $xlab_hostname ]]; then
		return 1
	else
		return 0
	fi
}

(isxlab && isweekday && isworkinghour)