#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Conditional-Constructs - describes the new test (i.e. [[ ) operator

# - The new test operator MUST use the && operator to combine two expressions
#   - Since [[ is a Bash keyword, it has its own special context and interprets the && correctly instead of as a normal Bash && (See
#     1-language/conditionals/2-and-operator.sh)
#   - Thus, the [ and [[ operators have incompatibly different ways of combining two expressions
logical_and_two_expressions() {
    #if [[ 'first' = 'first' -a 'second' = 'second' ]]; then
    if [[ 'first' = 'first' && 'second' = 'second' ]]; then
        echo 'Everything was true'
    else
        echo 'Something was false'
    fi
}

logical_and_two_expressions
