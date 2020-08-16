#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Conditional-Constructs - describes the new test (i.e. [[ ) operator

# - The new test operator has almost the same behavior as the old test operator in the case of providing a single argument to the operator. See
#   1-language/conditionals/old-test-operator/2-one-argument.sh
#   - The one difference is that it's a syntax error to just provide a unary conditional operator by itself. Good!
check_if_single_argument_is_not_null() {
    [[ false ]]; echo "$?" # 0
    [[ $(false) ]]; echo "$?" # 1
    [[ $not_set ]]; echo "$?" # 1
    # Syntax error
    #[[ -n ]]; echo "$?"
}

check_if_single_argument_is_not_null
