#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/TestsAndConditionals

# - The || operator performs the logical OR operation
#   - The second command only executes if the first command exited with anything other than 0
run_command_if_previous_command_failed() {
    rm blah || printf '%s\n' 'Failed to remove the directory!'
}

run_command_if_previous_command_failed