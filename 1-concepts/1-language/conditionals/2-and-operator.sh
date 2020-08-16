#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/TestsAndConditionals

# - The && operator performs the logical AND operation
#   - The second command only executes if the first command exited with 0
run_command_if_previous_command_was_successful() {
    printf '%s\n' 'Hello there!' && printf '%s\n' 'General Kenobi!'
    rm blah && printf '%s\n' 'Successfully removed the directory'
}

run_command_if_previous_command_was_successful