#!/bin/bash

# https://stackoverflow.com/questions/20858381/what-does-bash-c-do

cd $( dirname ${BASH_SOURCE[0]})

# The '-c' <string> option for Bash tells Bash to read commands from the <string>
# - Use xargs to transform stdin to program arguments. printf doesn't read from stdin, but xargs will transform stdin INTO program arguments. printf
#   reads from program arguments
# - Here, xargs is reading from stdin. The stdout of ls is piped into the stdin of xargs. Then, xargs can output programs arguments
# - Quotes are processed before other aspects of a Bash command. Therefore, enclosing the -c string in single quotes does NOT allow me to use the '
#   character within the command
function execute_from_string() {
    Bash -c "ls | xargs printf '%s !!! \n'"
}

execute_from_string