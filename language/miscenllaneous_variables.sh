#!/bin/bash

# https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php

# Are these Bash special variables, or sh special variables?

printf '%s\n' "Process ID: $$" # 11209

printf '%s\n' "Exit status: $?" 0

printf '%s\n' "User ID: $USER" # austinchang

sleep 1 # Sleep for 1 second
printf '%s\n' "Elpased time since script start: $SECONDS" # 1

# $RANDOM returns a new random number between 0 and 32767. $RANDOM is a function. It's range cannot be directly manipulated
printf '%s\n' "Random 1: $RANDOM, Random 2: $RANDOM" # 28169, 12383