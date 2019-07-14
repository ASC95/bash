#!/bin/bash

# https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php

# If a variable is used before it is set, no error is thrown.
# If a nonexistant variable is used, no error is thrown.


# When a variable is set, there must be NO space on either side of the "=" sign. A variable must have its value set before it can be read.
set_variable() {
    echo a_variable was $a_variable # does not throw an error, but $a_variable is 
    a_variable=13 # set the variable
    echo a_variable was $a_variable # read the variable
}


set_variable