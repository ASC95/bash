#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Builtin-Commands - describes the "test" (i.e. "[") operator in detail

# - See 1-language/parameters/command-as-argument.sh to understand this

# - If one argument is provided to the test operator, it evaluates to true if the single argument is not null
assert_that_single_argument_is_not_null() {
    # - The false command exits with 1, but does not evaluate to anything
    result=$(false)
    echo 'result is: ' $result # <nothing>
    # - "false" is an argument to the [ command, so "false" is treated as a string. "false" is not a null string. 
    # - See 1-language/parameters/command-as-argument.sh to understand this
    [ false ]; echo "$?" # 0
    # - The evaluation of the false command doesn't return anything, so the command substitution evaluates to the null string
    # - This turns into the case of providing 0 arguments to the [ operator
    [ $(false) ]; echo "$?" # 1
    # - $not_set evaluates to the null string
    # - This turns into the case of providing 0 arguments to the [ operator
    [ $not_set ]; echo "$?" # 1
}

assert_that_single_argument_is_not_null
