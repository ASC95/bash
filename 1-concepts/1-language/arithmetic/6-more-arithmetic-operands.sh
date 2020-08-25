#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Arithmetic - describes all arithmetic operands
# - https://www.shell-tips.com/bash/math-arithmetic-calculation/#using-the-bc-command-line - source focused on Bash math

# - When calculating a negative 2s-complement number, subtract the values of the bits with 0 from -1
#    - E.g. -1 - 2 - 8 = -11
bitwise_negation() {
    # 10  = 00001010
    # -11 = 11110101
    result=$((~10))
    echo $result # -11
}

bitwise_negation
