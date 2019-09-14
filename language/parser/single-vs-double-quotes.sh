#!/bin/bash

# https://stackoverflow.com/questions/6697753/difference-between-single-and-double-quotes-in-bash

# The interpolation that double quotes perform falls under the 

# Single quotes perform absolutely NO interpolation on the characters between them. Single quotes (even with backslashes) are not allowed between
# single quotes
no_interpolation() {
    echo 'The name of this script is $0' # The name of this script is $0
    sleep 10 &
    echo 'PID of last background process was $!' # PID of last background process was $!
}

interpolation() {
    echo "The name of this script is $0" # The name of this script is -bash
    sleep 10 &
    echo "PID of last background process was $!" # PID of last background process was 4106
}

#no_interpolation
interpolation