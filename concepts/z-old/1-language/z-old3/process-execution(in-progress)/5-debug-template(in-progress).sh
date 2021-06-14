#!/usr/bin/env bash
set -uo pipefail
trap 's=$?; echo "${0##*/}: Possible error on line "$LINENO": $BASH_COMMAND";' ERR

grep 'no' 'nope.txt' | sort 
echo "$?"