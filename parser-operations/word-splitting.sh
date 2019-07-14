#!/bin/bash

# When the shell is executing a script, it knows that there are different entities in the script. There are control structures (e.g. if-statements),
# strings, numbers, function declarations, variable initializations, etc. It will interpret some tokens as built-in Bash commands. When Bash
# finds a command, it needs to build an array to pass to the execve(2) system call. This array is composed of the string that represents the built-in
# command, arguments to the build-in command that Bash can determine from the tokens after the string command, and the current environment variables
# in the shell.
# Word splitting is important because it determines how the shell splits tokens into the array for the execve(2) system call.

rm_example() {
    #pwd
    #dirname
    echo ${BASH_SOURCE[0]}
}

rm_example