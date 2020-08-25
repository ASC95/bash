#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Arithmetic - describes variable expansion within arithmetic context

# - Variables are automatically expanded within $((<expression>))
#   - In other words, using "$" to expand the variable is not required, but it is good for clarity
reference_variables_within_arithmetic_context() {
    foo=10
    bar=12
    result=$(($foo - bar)); echo $result # -2
}

# - Null variables and non-integer variables, whether explicitly expanded or implicitly expanded, always evaluate to 0,
#   - $((<expression>)) and ((<expression>)) are identical in this regard
# - $((0)) returns 0 to the assignment
null_variables_and_non_integer_variables_evaluate_to_zero() {
    baz=''; result=$((baz)); echo "$result" # 0
    baz=' '; result=$((baz)); echo "$result" # 0
    baz='   '; result=$((baz)); echo "$result" # 0
    baz='blah'; result=$((baz)); echo "$result" # 0
    baz=' q '; result=$((baz)); echo "$result" # 0
    baz=''; result=$(($baz)); echo "$result" # 0
    baz=' '; result=$(($baz)); echo "$result" # 0
    baz='   '; result=$(($baz)); echo "$result" # 0
    baz='blah'; result=$(($baz)); echo "$result" # 0
    baz=' q '; result=$(($baz)); echo "$result" # 0
}

# - Please don't ever do this
accidental_double_assignment() {
    # - I think that what this does is 1) assign var to be 52 2) return var to result
    # - As a bonus confusing bit, the variable "var" now exists! At least "var" and "result" are separate
    result=$((var=55 - 3)); echo "$result" # 52
    echo "$var" # 52
    ((var--))
    echo "$var" # 51
    echo "$result" # 52
}

# - For whatever reason, assigning a null or whitespace value to an EXPLICITLY expanded variable within an arithmetic context is a syntax error
#    - The behavior as the same as 1-language/arithmetic/3-arithmetic-expansion-evaluation/2-variables.sh
assignment_of_a_null_or_whitespace_explicitly_expanded_variable_is_a_syntax_error() {
    # - This is fine because the variable was not explicitly expanded
    baz=''; result=$((var=baz)); echo "$result" # 0
    # - Syntax error
    baz=''; result=$((var=$baz)); echo "$result" # 1
}

#reference_variables_within_arithmetic_context
#null_variables_and_non_integer_variables_evaluate_to_zero
#accidental_double_assignment
assignment_of_a_null_or_whitespace_explicitly_expanded_variable_is_a_syntax_error
