#!/bin/bash

# https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html - all special parameters

# The shell has 9 special parameters that are read-only in any scope
# - Bash has its own set of special variables that no other shell has. Those are different from the special parameters described here

# Within a function, $* refers to the arguments that were passed to THIS function.
# - When $* is referenced without double quotes, each positional parameter expands to a separate word
# - When "$*" is referenced with double quotes, each parameter is 
all_command_line_arguments() {
    echo $* # first arg second-arg third arg
    echo $*[1]
    echo "$*" # first arg second-arg third    arg
    echo $# # 3
}

x() {
    echo $@
    echo "$@"
}

all_command_line_arguments 'first arg' 'second-arg' 'third    arg'
#x 'first' 'second' 'third'