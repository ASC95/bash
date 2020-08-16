#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Arithmetic
# - https://unix.stackexchange.com/questions/16109/bash-double-equals-vs-eq - more details on arithmetic evaluation

# - Non-integer variables evaluate to 0 in both the $((<expression>)) and ((<expression>)) arithmetic contexts
# - It is a syntax error to try and assign the result of ((<expression>)) to something
non_integer_variables() {
    foo='bar'
    #result=$((1/$foo)) # division by 0
    result=$((quack))
    echo $result # 0
    # This is a syntax error. I should only ever be using ((<expression>)) with an if-statement anyway
    #result=((quack))
    # This is also a syntax error. The problem is not <expression>, it's that I'm trying to assign the output of ((<expression>))
    #result=((5))
    ((quack))
    echo $? # 1
}

# - When calculating a negative 2s-complement number, subtract the values of the bits with 0 from -1
#    - E.g. -1 - 2 - 8 = -11
bitwise_negation() {
    # 10  = 00001010
    # -11 = 11110101
    result=$((~10))
    echo $result # -11
}

# It appears that performing a comparison within a $((<expression)) arithmetic context returns the evaluation of the exit code of the comparison
equality() {
    # 5 == 4 results in an exit code of 1, and $((1)) evaluates to 0
    result=$((5 == 4))
    echo $result # 0
    # 5 == 5 results in an exit code of 0, and $((0)) evaluates to 1
    result=$((5 == 5))
    echo $result # 1
    ((5 == 4))
    echo $? # 1
    ((5 == 5))
    echo $? # 0
}

#non_integer_variables
#bitwise_negation
equality