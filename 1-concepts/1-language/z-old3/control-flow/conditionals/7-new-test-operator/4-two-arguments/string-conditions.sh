#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/TestsAndConditionals - main guide on string equality
# - https://tiswww.case.edu/php/chet/bash/bashref.html#Conditional-Constructs - describes the new test (i.e. [[ ) operator
# - https://tiswww.case.edu/php/chet/bash/bashref.html#Bash-Conditional-Expressions - Bash unary conditional operators
# - https://stackoverflow.com/questions/13509508/check-if-string-is-neither-empty-nor-space-in-shell-script - assert that string is neither null nor whitespace

# - The behavior of the new test operator is NOT the same as the old test operator
#   - It's a syntax error to provide a unary conditional operator by itself to the new test operator 
#   - Therefore, in these examples the new test operator MUST be expanding the variables that contain null strings and it must actually be evaluating
#     those null strings
#       - Does this have something to do with the fact that word splitting is not performed within Bash keyword contexts? (See
#         1-language/parser/word-splitting/2-keyword-context.sh)
#   - By contrast, the old test operator would expand the variables into null strings and then act like nothing was there at all
assert_string_is_null() {
    # - I believe that the new test operator must actually be saying that these strings are null
    foo=''
    [[ -z $foo ]]; echo $? # 0
    [[ -z $blah ]]; echo $? # 0
    [[ -z blah ]]; echo $? # 1
}

# - Use the -n unary conditional operator to assert that a string is not null
#   - This actually works as expected, unlike the old test operator
# - The -v unary conditional operator only checks if a variable is set or not
#   - Thus, checking for nullnes encompasses the -v check, so I'll usually want to use -n instead of -v
assert_string_is_not_null() {
    [[ -n '' ]]; echo $? # 1
    [[ -n ' ' ]]; echo $? # 0
    [[ -n $cat ]]; echo $? # 1
    # - These quotes are unnecessary
    [[ -n "$cat" ]]; echo $? # 1
}

# - See 1-language/string-manipulation/1-substring-replacement.sh
assert_that_string_is_neither_null_nor_whitespace() {
    idx=0
    printf '%s\n' "There were $# positional arguments"
    for i in "$@"; do
        # - Replace all whitespace with null string, then check if the result is null
        if [[ -z ${i// /} ]]; then
            printf '%s\n' "Positional argument $idx, \"$i\", was null or only contained whitespace"
        else
            printf '%s\n' "Positional argument $idx, \"$i\", was not null, nor contained only whitespace"
        fi
        ((idx++))
    done
}

#assert_string_is_null
#assert_string_is_not_null
assert_that_string_is_neither_null_nor_whitespace 'foo bar' ' ' '' '     ' 'ha'
