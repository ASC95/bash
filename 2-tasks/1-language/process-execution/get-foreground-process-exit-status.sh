#!/usr/bin/env bash

# - The special parameter "?", which is expanded with regular variable notation "$?", contains the exit status of the last foreground process
# - ping Google once, then print the exit status of the ping command
get_foreground_process_exit_status() {
    ping -c 1 'www.google.com'
    printf '%s\n' $?
}

get_foreground_process_exit_status