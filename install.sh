#!/bin/bash
trap SIGINT
set -e
set -o pipefail
pathtoscript="./hpe-3par-disk-converter"
pathtotask="./hpe-3par-disk-converter-task"

check_for_root_user(){
	if [ "$(id -u)" != "0" ]; then
	   echo "This script must be run as root" 1>&2
	   exit 1
	fi
}
main(){
	check_for_root_user
	if [ -f "${pathtoscript}" ] && [ -f "${pathtotask}" ]
	then
		cp ${pathtoscript} /usr/local/bin/bash
		cp ${pathtotask} /usr/local/bin/bash
		cd /usr/local/bin/bash
		chmod 644 ${pathtoscript}
		chmod 644 ${pathtotask}
    echo "The installation was SUCCESSFUL"
	else
		echo "The Files are not in the same Directory as the install Script"
		exit 1
	fi
}
main
