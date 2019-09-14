#!/bin/bash

# http://mywiki.wooledge.org/BashGuide/InputAndOutput
# https://stackoverflow.com/questions/2188199/how-to-use-double-or-single-brackets-parentheses-curly-braces - {...}

# A FIFO (file) is also referred to as a "named pipe". It accomplishes the same job as the pipe operator, but with a filename.

cd "$( dirname "${BASH_SOURCE[0]}" )"

# File redirection works well when I want to send output to files or read input from files, but what if I want to connect the input and output of two
# processes. A pipe is used to send the stdout of one command into the stdin of a different command. 
# - Pipes only work if the first process is producing stdout AND the second process is reading from stdin

# The stdout of echo is piped to the stdin of grep.
echo_to_grep() {
    echo 'rat cow deer snake
 bear
    bean' | grep bea
}

# The stdout of echo is piped to the stdin of grep, but grep completely ignores it since it's reading from the file test.txt instead of stdin!
bad_echo_to_grep() {
    #grep bea test.txt
    echo 'rat cow deer snake
 bear
    bean' | grep bea test.txt
}

# Every command that is piped into is executed in its own subshell environment. That means changes made to the current environment that occur within
# the subshell environment are NOT persisted
pipe_creates_subshell() {
    my_var='12345'
    # Braces {...} execute a sequence of commands in the current shell context. Therefore, the modification to my_var is still relevant to the printf call
    echo 'Some cool output' | { read my_var && printf '%s\n' "${my_var}";} # Some cool output
    # There are no braces, so $ read my_var $ occurs in its own subshell, and afterwards the printf call is in the top-most shell environment
    echo 'Some cool output' | read my_var && printf '%s\n' "${my_var}" # 12345
    # Any changes made by the subshell were clearly not persisted
    printf '%s\n' "${my_var}" # 12345
}

#echo_to_grep
#bad_echo_to_grep
pipe_creates_subshell