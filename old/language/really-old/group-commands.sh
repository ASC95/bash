#!/usr/bin/env bash

# https://mywiki.wooledge.org/BashGuide/TestsAndConditionals - easy grouping introduction
# https://tiswww.case.edu/php/chet/bash/bashref.html#Command-Grouping - 2 types of grouping
# https://unix.stackexchange.com/questions/484442/how-can-i-get-the-pid-of-a-subshell - $$ is weird

# My only question is: when does the parser perform grouping?

cd $( dirname ${BASH_SOURCE[0]} )

# Using braces {..} to group statements will executes those statements in the current process (aka the current shell context). 
# - The semicolon BEFORE the closing brace is required
# - The braces MUST be separated from other characters by whitespace of shell metacharacters
# - Braces are also used to perform brace expansion, but specifically with the '<PREAMBLE>{<start>..<end>}<POSTSCRIPT>' syntax
brace_grouping() {
    #echo "The current pid is $$" && { echo "The pid is still $$" } # Bad b/c no semicolon
    #echo "The current pid is $$" && {echo "The pid is still $$";} # Bad b/c opening brace isn't separated
    echo "The current pid is $BASHPID" && { echo "The pid is still $BASHPID"; } # The values of $$ are the same b/c we're in the same process
}

# - <cmd1> && <cmd2> executes <cmd2> only if <cmd1> returned with an exit status of 0 (no error)
# - <cmd1> || <cmd2> executes <cmd2> only if <cmd1> returned with an exit status of NOT 0 (there WAS an error)
brace_group_control_operators() {
    # This is wrong. rm 'blahblah.txt fails and Bash finds the first || operator and executes the wrong echo command.
    rm 'blahblah.txt' 2>/dev/null && rm 'nothere.txt' 2>/dev/null || echo nothere.txt removal failed'!' || echo blahblah.txt removal failed
    # This is right. rm 'blahblah'.txt fails and Bash skips the entire group and executes the correct echo command
    rm 'blahblah.txt' 2>/dev/null && { rm 'nothere.txt' 2>/dev/null || echo nothere.txt removal failed'!'; } || echo blahblah.txt removal failed
}

# If redirection is used on a group, that redirection applies to all commands within that group
brace_redirect_file_descriptor() {
    {
        grep 'brace' | cut -c 1-10 # cut is being piped into, so its stdin comes from grep
    } < ${BASH_SOURCE[0]}
}

# Using parentheses (..) to group statements will execute the statements in a child process (aka a subshell)
# - Parentheses are also used to create arrays, but specifically with the '=()' syntax
# - $$ expands to the pid the current shell. Even if $$ is used within a '()' subshell, $$ is still the pid of the current shell. Using $BASHPID is
#   non-portable, but it demonstrates that a subshell (usually) executes in a subprocess (depending on the shell)
parentheses_grouping() {
    echo "The current pid is $BASHPID" && ( echo "The pid is changed to $BASHPID" )
}

#brace_grouping
#brace_group_control_operators
brace_redirect_file_descriptor
#parentheses_grouping