#!/usr/bin/env bash

# - http://mywiki.wooledge.org/WordSplitting?highlight=%28word%29%7C%28splitting%29 - describes word splitting

# - The @ variable (expanded as $@) is special when it comes to the treatment of double quotes with regard to word splitting, but ONLY in a normal
#   context. The rules for keyword contexts and VARIABLE EXPANSION within assignment expression contexts are dominant over this rule
#   - If the expansion is unquoted, then EVERY element WITHIN the array undergoes word splitting
#   - If the expansion is quoted, then EVERY element WITHIN the array does NOT undergo word splitting
special_positional_parameter_array_variable_is_special() {
    printf '~%s~ ' $@ # ~red~ ~cat~ ~blue~ ~dog~ ~green~ ~frog~ 
    echo ''
    printf '~%s~ ' "$@" # ~red cat~ ~blue dog~ ~green frog~
}

# - When any array, including the @ array, is expanded within a Bash keyword context, the array simply becomes one long string
#   - In other words, NO word splitting occurs!
#   - This is simply proof that word splitting never occurs within Bash keywords
every_array_is_a_single_string_within_a_keyword_context() {
    if [[ $@ == 'red cat blue dog green frog' ]]; then
        printf 'The strings are equal'
    else
        printf 'The strings are not equal'
    fi
}

# - Regardless of whether $@ is quoted or not, it does not undergo word splitting when it is assigned to a variable
word_splitting_is_not_done_on_variable_expansions_with_assignment_expressions() {
    #var=$@
    var="$@"
    printf '~%s~ ' "$var" # ~red cat blue dog green frog~ 
}

#special_positional_parameter_array_variable_is_special 'red cat' 'blue dog' 'green frog'
#every_array_is_a_single_string_within_a_keyword_context 'red cat' 'blue dog' 'green frog'
word_splitting_is_not_done_on_variable_expansions_with_assignment_expressions 'red cat' 'blue dog' 'green frog'
