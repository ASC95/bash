#!/bin/bash

# https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php

access_arguments() {
    echo The first argument was $1
    echo The second argument was $2
}

access_arguments cat