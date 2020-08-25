#!/usr/bin/env bash

# - https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html - ? special parameter

# - The special parameter "?", which is expanded with regular variable notation "$?", contains the exit status of the last foreground process
# - In this example, ping Google once, then print the exit status of the ping command
get_foreground_process_exit_status() {
    ping -c 1 'www.google.com'
    printf '~%s~\n' $?
}

get_foreground_process_exit_status
