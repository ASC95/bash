#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Arithmetic
# - https://unix.stackexchange.com/questions/16109/bash-double-equals-vs-eq - more details on arithmetic evaluation

# - It IS legal to use the == operator with an arithmetic context to perform numeric comparision
double_equals_operator() {
    # These are equal, so this becomes ((0)). ((0)) evaluates to an exit code of 1
    ((01 == 1))
    echo $? # 0
    # ((0)) exits with 1
    ((0))
    echo $? # 1
    # true is not a variable, so this becomes ((0)), which exits with 1
    (( true ))
    echo $? # 1
    # false is not a variable, so this becomes ((0)), which exits with 1
    (( false ))
    echo $? # 1


    #result=$((01 == 1))
    #echo $result # 1
}

double_equals_operator