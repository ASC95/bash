#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/TestsAndConditionals

# - The $ exit $ command returns the desired exit status
#   - It is useful for returning 1 if some non-automatically-failing condition in a script is not met (e.g. the file extension of a file to read was
#     incorrect)
return_custom_exit_status() {
    printf '%s\n' 'hello!'
    #exit 0
    exit 1
    #exit 55
}

return_custom_exit_status