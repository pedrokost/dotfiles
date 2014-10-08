#!/usr/bin/env bash
xlab_hostname='pedro-xlab'

isxlab () {
	if [[ `hostname -s` = $xlab_hostname ]]; then
		if [ -z "$(pgrep $1)" ]
			then
				# foo is not running
				echo "Will now execute $@"
				exec $@
			else
				echo "$1 is already running!"
		fi
	fi
}

isxlab $@