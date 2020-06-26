#!/bin/bash

# https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php

# This syntax is incorrect. Bash will complain about a nonexistent command called "incorrect_syntax"
#incorrect_syntax {
#    echo This will never work
#}

# If the function keyword is used, the parentheses may be omitted or included
function first_syntax {
    echo One syntax uses the \"function\" keyword
}

# If parentheses are used to declare a function, they are always empty
second_syntax() {
    echo This other syntax uses empty parentheses
}

#first_syntax
second_syntax