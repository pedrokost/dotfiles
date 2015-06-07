#!/usr/bin/env bash
# @Author: Pedro Kostelec
# @Date:   2015-06-07 10:39:03
# @Last Modified by:   Pedro Kostelec
# @Last Modified time: 2015-06-07 10:43:39


if [ -z "$(pgrep $1)" ]
	then
		# foo is not running
		echo "Will now execute $@"
		exec $@
	else
		echo "$1 is already running!"
fi