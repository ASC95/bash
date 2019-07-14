#!/bin/bash

# https://mywiki.wooledge.org/Arguments
# https://mywiki.wooledge.org/WordSplitting

# The shell's job is to translate my strings into system calls. Every built-in Bash command is actually a file (e.g. /bin/rm). When a built-in command
# is executed, the path of the file (e.g. /bin/rm) is passed to the execve(2) system call along with 1) an array of arguments and 2) an array of
# environment variables.

# Before the shell every executes any commands, the parser performs the following operations in order:
# 1) brace expansion
# 2) tilde expansion
# 3) parameter, variable, and arithmetic expansion
# 4) command substitution: $()
# 5) word splitting
# 6) pathname expansion