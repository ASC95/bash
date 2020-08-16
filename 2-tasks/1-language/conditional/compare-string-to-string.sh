#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/TestsAndConditionals

# - TLDR; use the new test operator and double quote both operands

# - The "[" character is called the "test operator"
# - The test operator expects the first or second operand to be an operator
#   - Arguments must always be quoted because variables with whitespace will confuse the operator
compare_string_equality_with_simple_test_operator() {
    if [ "$1" = "$2" ]; then # 'foo bar', =, 'foo bar', and ] are the four arguments to the [ operator
    #if [ $1 = $2 ]; then # This will mess up if the variables have whitespace
        printf '%s\n' "$1 was equal to $2"
    else
        printf '%s\n' "$1 was not equal to $2"
    fi
}

# - Unlike the old test operator, the new test operator [[ does not require that variables be quoted
#   - This is because [[ does not perform word-splitting of its arguments
# - However, whitespace still delineates arguments just like in any other part of a Bash script, so normal strings should be quoted with double quotes
#   - I say double quotes because I'll almost always want to expand variables within the new test operator   
compare_string_equality_with_new_test_operator() {
    if [[ "This is $1" = "This is $2" ]]; then
    #if [[ This is $1 = This is $2 ]]; then # This doesn't work because normal unquoted strings are indeed separate arguments. Nothing special about that!
        printf '%s\n' "$1 was equal to $2"
    else
        printf '%s\n' "$1 was not equal to $2"
    fi
}

#compare_string_equality_with_simple_test_operator 'foo bar' 'foo bar'
compare_string_equality_with_new_test_operator 'foo bar' 'foo bar'
