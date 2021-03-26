#!/usr/bin/env bash

# - "$" contains the value of the shell PID
#   - All subshells inherit the value of "$" from the original parent shell, so "$" always contains the value of the original parent shell
#       - Executing this script results in a new PID each time (see execute-vs-source.sh) 
#       - Sourcing this script results in the same PID each tiem (see execute-vs-source.sh)
get_shell_pid() {
    echo $$
}

get_shell_pid