#!/usr/bin/env bash

# - http://mywiki.wooledge.org/WordSplitting?highlight=%28word%29%7C%28splitting%29 - describes word splitting

# - Word splitting is not done on variable expansions during an assignment expressions
#   - This does not mean that no word splitting can occur after the "=" sign!

cd "$(dirname "${BASH_SOURCE[0]}")"

# - When a variable expansion is used in an assignment expression, the variable expansion does not undergo word splitting
word_splitting_is_not_performed_on_variable_expansions_in_assignments() {
    var='Hello there! General Kenobi!'
    new_var=$var
    printf '~%s~\n' "$new_var" # ~Hello there! General Kenobi!~
}

# - To reinforce this point, this shows that word splitting is not performed with command substitution in an assignment expression
#   - Is command substituion considered a form of variable expansion???
word_splitting_is_not_performed_on_variable_expansions_in_assignments2() {
    # - Word splitting is performed as expected
    printf '~%s~ ' $(ls) # ~1-normal-context.sh~ ~2-keyword-context.sh~ ~3-assignment-context.sh~ ~4-array-context.sh~ 
    # - Word splitting is not performed, as expected
    var=$(ls)
    printf '~%s~ ' "$var" # ~1-normal-context.sh 2-keyword-context.sh 3-assignment-context.sh 4-array-context.sh~
}

# - While word splitting is not performed on VARIABLE expansions within an assignment expression, separate string literals are already considered
#   separate words!
#   - As a result, this is a syntax error because "two" is not a recognized command
separate_string_literals_are_still_separate() {
    var=one two three
    printf '~%s~ ' "$var" # ~~
}

# - While it is true that word splitting is not performed on VARIABLE EXPANSIONS an assignment expression context, I need to be careful
#   - In this example, there is an array creation context WITHIN the assignment expression context. Word splitting DOES occur within the array
#     creation context
word_splitting_can_still_occur_on_non_variable_expansions() {
    var1='red cat'
    var2='blue dog'
    var3='green frog'
    ary=($var1 $var2 $var3)
    printf '~%s~ ' "${ary[@]}" # ~red~ ~cat~ ~blue~ ~dog~ ~green~ ~frog~
}

#word_splitting_is_not_performed_on_variable_expansions_in_assignments
#word_splitting_is_not_performed_on_variable_expansions_in_assignments2
#separate_string_literals_are_still_separate
word_splitting_can_still_occur_on_non_variable_expansions
