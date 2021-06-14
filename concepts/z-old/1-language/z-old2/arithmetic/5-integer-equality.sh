#!/usr/bin/env bash

# - https://mywiki.wooledge.org/ArithmeticExpression?highlight=%28let%29 - Bash arithmetic operators have the same rules as C arithmetic operators (I
#   think!)
# - https://docs.microsoft.com/en-us/cpp/c-language/c-relational-and-equality-operators?view=vs-2019 - C relational and equality operators
# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Arithmetic - list of arithmetic operators
# - https://unix.stackexchange.com/questions/16109/bash-double-equals-vs-eq - more details on arithmetic comparison

# - These notes only make sense if I've read 2-arithmetic-expansion/ AND 3-arithmetic-expansion-evaluation/
# - In C, the result of a relational expression is 1 if the tested relationship is true and 0 if it is false

# - Within an arithmetic context, the == operator MUST be used to check for integer equality
#   - Within an arithmetic context, the = operator is assignment 
assert_equality_within_arithmetic_context() {
    # - These are both syntax errors within an arithmetic context
    #((01 -eq 1)); echo "$?"
    #((01 = 1)); echo "$?"
    # - Octal 077 is 63, so the expression is true. The expression is true, so it evalutes to 1. ((1)) exits with 0 (success)
    ((077 == 63)); echo "$?" # 0
    # - The expression is false
    ((077 == 64)); echo "$?" # 1
    # - The expression is true
    ((-1*(5) == -5)); echo "$?" # 0
    # - The expression is true, so the context returns 1. THIS IS DIFFERENT FROM A ((<expression>)) context!
    result=$((4 == 4)); echo $result # 1
}

# - I show this for completeness. I don't want to do math within an old test context
#   - Octal (and I'm assuming hex) notation isn't respected within the old test context
assert_equality_within_old_test_context() {
    [ 077 -eq 63 ]; echo "$?" # 1
    # - This does not work
    #if [ 077 -eq 63 ]; then
    # - This works
    if [ 63 -eq 63 ]; then
        echo 'numbers were equal'
    else
        echo 'numbers were not equal'
    fi
}

# - I show this for completeness. I don't want to do math within an new test context
#   - Octal (and I'm assuming hex) notation ARE respected within the new test context
assert_equality_within_new_test_context() {
    [[ 077 -eq 63 ]]; echo "$?" # 0
    # - These are both STRING comparision in this context. That is NOT what I want here
    #[[ 077 = 63 ]]; echo "$?" # 1
    #[[ 077 == 63 ]]; echo "$?" # 1
    # - This works
    if [[ 077 -eq 63 ]]; then
        echo 'numbers were equal'
    else
        echo 'numbers were not equal'
    fi
}

#assert_equality_within_arithmetic_context
#assert_equality_within_old_test_context
assert_equality_within_new_test_context
