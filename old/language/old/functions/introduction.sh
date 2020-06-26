#!/bin/bash

# https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php

# Bash functions don't require parentheses. They are only there for decoration. Nothing ever goes inside of parentheses of a function declaration (if
# they are even there at all))

access_arguments() {
    echo what was $0
    echo The first argument was $1
    echo The second argument was $2 # If an argument wasn't passed, then $2 == ???
}

# A function MUST be defined before it can be invoked. Functions are invoked when their names are written. No parentheses are used to invoke a function
access_arguments cat