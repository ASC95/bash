#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Conditional-Constructs - ((<expression>)) context
# - https://tiswww.case.edu/php/chet/bash/bashref.html#Arithmetic-Expansion - $((<expression>)) context
# - https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html - ? special parameter

# - $ ((<expression>)) $ evaluates <expression> in an arithmetic context instead of a string context
#   - $ ((<expression>)) does not return the value of <expression>. It only returns an exit code
# - Only integer arithmetic is natively supported. Floating-point arithmetic is not natively supported
evaluate_arithmetic_exit_code() {
    # If <expression> evaluates to 0, the arithmetic context exits with an error exit status of 1
    ((0))
    # Recall that ? contains the exit status of the last foreground pipeline
    printf '%s\n' $? # 1
    # If <expression> evaluates to a non-zero integer, the arithmetic context exits with an exit status of 0 (no error)
    ((1))
    printf '%s\n' $? # 0
}

# - Within a $((<expression>)) context, <expression> is treated as if it were already entirely within double quotes
#   - Explicit double quotes within <expression> are not given special treatment
evaluate_arithmetic_expression() {
    a=2
    b=3
    c='FF'
    result=$(($a + $b + $c))
    echo $result # 9
}

#evaluate_arithmetic_exit_code
evaluate_arithmetic_expression
