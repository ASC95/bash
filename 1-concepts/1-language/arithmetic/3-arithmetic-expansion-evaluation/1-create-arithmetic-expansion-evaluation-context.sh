#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Conditional-Constructs - describes ((<expression>)) context
# - https://www.shell-tips.com/bash/math-arithmetic-calculation/#using-the-bc-command-line - source focused on Bash math
# - https://docs.microsoft.com/en-us/cpp/c-language/c-relational-and-equality-operators?view=vs-2019 - C relational and equality operators

# - The primary purpose of ((<expression>)) is to assert whether some relational comparision was true

# - The "compound command used to evaluate arithmetic expansion" (i.e. the ((<expression>)) ) context is often used to assert that an arithmetic
#   expression evaluted to a non-zero integer
#   - If ((<expression>)) evaluates to 0, the arithmetic context exits with an error exit status of 1
#   - If ((<expression>)) evaluates to a non-zero integer, the arithmetic context exits with an exit status of 0 (no error)
assert_expression_evaluated_to_nonzero_integer() {
    # - Failure
    ((0)); echo "$?" # 1
    # - Success
    ((1)); echo "$?" # 0
}

# - This example shows how to use the exit status of the ((<expression>)) context to do something useful
#   - In C, a relational operation evalutes to 1 if it is successful. In this case 5 == 5 is true, so it evaluates to 1. ((1)) exits with 0 (success)
use_context_with_if_statement() {
    if ((5 == 5)); then
        echo 'The numbers are equal'
    else
        echo 'The numbers are not equal'
    fi
}

# - Even though ((<expression>)) doesn't return the value of <expression>, it's still useful because any variables it manipulates or creates are
#   visible outside of its context
#   - The point is that $((<expression>)) isn't the only way to evaluate an arithmetic expression
#   - I can just ignore the exit codes if I use ((<expression>)) in this way, but that's actually a bad idea if something is monitoring the script for
#     failed exit codes
evaluate_expression_and_get_exit_code() {
    # Variable $a evaluated to a non-zero integer, so the exit code of ((<expression>)) was 0 to indicate success
    a=1
    ((a++)); echo "$?" # 0
    echo $a # 2
    # Variable $b evaluated to a non-zero integer, so the exit code of ((<expression>)) was 0 to indicate success
    ((b=5 + 1)); echo "$?" # 0
    echo $b # 6
    # Variable $c evaluated to 0, so the exit code of ((<expression>)) was 1 to indicate failure
    ((c=0)); echo "$?" # 1
    echo $c # 0
}

# - $ let $ is identical to ((<expression>)) except for the need for quotes
#   - An expression used with $ let $ command requires double quotes if it contains whitespace
use_older_form_of_same_context() {
    let a=23+17
    echo $a # 40
    # Syntax error
    #let a=23 + 17
    # Good
    let 'a=2 + 7'
    echo $a # 9
    # Good
    let "a=1 + 3"
    echo $a # 4
    # Good
    let a='5 + 6'
    echo $a # 11
    # Good
    let a="3 + 3"
    echo $a # 66
}

#assert_expression_evaluated_to_nonzero_integer
#use_context_with_if_statement
evaluate_expression_and_get_exit_code
#use_older_form_of_same_context
