#!usr/bin/env bash

# http://mywiki.wooledge.org/BashGuide/InputAndOutput
# https://stackoverflow.com/questions/2188199/how-to-use-double-or-single-brackets-parentheses-curly-braces - {...}
# https://www.gnu.org/software/bash/manual/html_node/Command-Grouping.html
# https://stackoverflow.com/questions/30727590/grouping-commands-in-curly-braces-and-piping-does-not-preserve-variable - finally! Helpful!

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

# Every command that is piped into is executed in its own subshell environment. That means that any changes caused by the subshell will not affect the
# current shell
# - Using {...;} (i.e. command grouping) cannot fix this because the pipe creates the subshell regardless (see link). In fact, command grouping with a
#   pipe will cause ALL grouped commands to run in the subshell
pipe_creates_subshell() {
    my_var='12345'
    # Braces {...} execute a sequence of commands in the current shell context, but the subshell created by a pipe will ignore this. The
    # modification to my_var only exists in the subshell
    echo 'Some cool output' | { read my_var && printf '%s\n' "${my_var}";} # Some cool output
    # There are no braces, so $ read my_var $ occurs in the subshell but $ printf ... $ occurs in the current shell
    echo 'Some cool output' | read my_var && printf '%s\n' "${my_var}" # 12345
    # Any changes made by the subshell were clearly not persisted
    printf '%s\n' "${my_var}" # 12345
}

#echo_to_grep
#bad_echo_to_grep
pipe_creates_subshell