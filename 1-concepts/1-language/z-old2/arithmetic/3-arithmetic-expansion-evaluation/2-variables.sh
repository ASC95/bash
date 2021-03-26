#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Arithmetic - describes variable expansion within arithmetic context

# - Variables are automatically expanded within ((<expression>))
#   - In other words, using "$" to expand the variable is not required, but it is good for clarity
reference_variables_within_arithmetic_context() {
    foo=10
    bar=12
    ((result = $foo - bar)); echo $result # -2
}

# - Null variables and non-integer variables, whether explicitly expanded or implicitly expanded, always evaluate to 0,
#   - $((<expression>)) and ((<expression>)) are identical in this regard
# - ((0)) exits with 1
null_variables_and_non_integer_variables_evaluate_to_zero() {
    baz=''; ((baz)); echo "$?" # 1
    baz=' '; ((baz)); echo "$?" # 1
    baz='   '; ((baz)); echo "$?" # 1
    baz='blah'; ((baz)); echo "$?" # 1
    baz=' q '; ((baz)); echo "$?" # 1
    baz=''; (($baz)); echo "$?" # 1
    baz=' '; (($baz)); echo "$?" # 1
    baz='   '; (($baz)); echo "$?" # 1
    baz='blah'; (($baz)); echo "$?" # 1
    baz=' q '; (($baz)); echo "$?" # 1
}

# - For whatever reason, assigning a null or whitespace value to an EXPLICITLY expanded variable within an arithmetic context is a syntax error
#   - The behavior of $((<expression>)) and ((<expression>)) is the same in this regard
assignment_of_a_null_or_whitespace_explicitly_expanded_variable_is_a_syntax_error() {
    # - These are all fine
    #baz=''; ((result=baz)); echo "$?" # 1
    #baz=' '; ((result=baz)); echo "$?" # 1
    #baz='   '; ((result=baz)); echo "$?" # 1
    #baz='blah'; ((result=baz)); echo "$?" # 1
    #baz=' q '; ((result=baz)); echo "$?" # 1
    # - These three are syntax errors
    baz=''; ((result=$baz)); echo "$?" # 1
    baz=' '; ((result=$baz)); echo "$?" # 1
    baz='   '; ((result=$baz)); echo "$?" # 1
    # - These two are not syntax errors
    #baz='blah'; ((result=$baz)); echo "$?" # 1
    #baz=' q '; ((result=$baz)); echo "$?" # 1
}

#reference_variables_within_arithmetic_context
#null_variables_and_non_integer_variables_evaluate_to_zero
assignment_of_a_null_or_whitespace_explicitly_expanded_variable_is_a_syntax_error
