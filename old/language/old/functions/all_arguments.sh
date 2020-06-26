#!/bin/bash

# https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php

# Bash does not have special command-line arguments. It is simply the case that positional parameters outside of a function happen to also be
# command-line arguments
function view_positional_arguments() {
    printf '%s' "The positional arguments were $0 $1 $2 $3" # The positional arguments were /bin/bash hi bye
}

# $@ contains all of the arguments that were passed to a function
# - Printing $@ directly does not separate the arguments, but iterating over them in a for-loop does
function view_all_arguments() {
    printf '%s' "$@" # hibye
    for n in $@
    do
        printf '\n%s' "${n}" # \nhi\nbye
    done
}

function view_argument_count() {
    printf '%s' "$#" # 2
}

#printf '%s\n' "The command-line arguments were $0 $1 $2 $3" # The command-line arguments were /bin/bash
#view_positional_arguments 'hi' 'bye'
#view_all_arguments 'hi' 'bye'
#view_argument_count 'hi' 'bye'