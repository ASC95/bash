#!/bin/bash

# https://stackoverflow.com/questions/2953646/how-to-declare-and-use-boolean-variables-in-shell-script

# Bash has a built-in $ true $ command that always returns with an exit code of 0. Try it in the terminal.
built_in_true_command() {
    var=true # var is equal to the string "true". Later on in the if-statement, the string "true" will be parsed as the built-in command $ true
    #var=truez # command not found. There is not "truez" command
    if $var
    then
        echo var was true
    else
        echo var was false
    fi
}

# Bash has a built-in $ false $ command that always returns with a nonzero exit code. Try it in the terminal.
built_in_false_command() {
    var=false # var is equal to the string "false". Later on in the if-statement, the string "false" will be parsed as the built-in command $ false
    #var=falsez # command not found. There is not "falsez" command
    if $var
    then
        echo var was true
    else
        echo var was false
    fi
}

check_true_variable() {
    if 
}

#built_in_true_command
built_in_false_command