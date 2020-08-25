#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Arithmetic-Expansion - describes $((<expression>)) context
# - https://www.shell-tips.com/bash/math-arithmetic-calculation/#using-the-bc-command-line - source focused on Bash math

# - The primary purpose of $((<expression>)) is to assign the result of <expression> to a variable

# - If I want to explicitly return the result of an expression, I can use $((<expression>))
#   - $((<expression>)) must be used in an assignment expression
evalute_expression_and_return_result() {
    a=2
    b=3
    result=$(($a + $b))
    echo $result # 5
    # Syntax error
    #$(($a + $b))
}

# - $((<expression>)) returns the result of the relational comparision
#   - I really should use ((<expression>)) instead of $((<expression>)) for relational comparisions, but the point is that I CAN do this if I want
get_result_of_relational_operation() {
    # - The relational comparison was successful, so it evaluated to 1 as per C rules
    result=$((4 == 4)); echo $result # 1
}

# - The exit code of the arithmetic expansion context (i.e. $((<expression>)) ) is always 0 unless there was a huge error that terminates the entire
#   script
#   - For this reason, the exit code of a $((<expression>)) context usually isn't important, but it's worth considering for the sake of comparison
#     with the ((<expression>)) context
check_exit_code() {
    var=$((0)); echo "$?" # 0
    echo "$var" # 0
    var=$((2)); echo "$?" # 0
    echo "$var" # 2
    var=$((foo)); echo "$?" # 0
    echo "$var" # 0
    # - Syntax error
    #var=$(('quack'))
    # - Division by zero error
    #var=$((1/0)); echo "$?"
}

#evalute_expression_and_return_result
get_result_of_relational_operation
#check_exit_code
