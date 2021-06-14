#!/usr/bin/env bash

# - http://mywiki.wooledge.org/WordSplitting?highlight=%28word%29%7C%28splitting%29 - describes word splitting

# - Word splitting is never done within Bash keyword contexts

# - The [[ operator is a Bash keyword, so word splitting is not performed within its context
#   - For that reason, variables do not need to be double quoted within the [[ operator context
word_splitting_never_occurs_within_bash_keywords() {
    var='Hello there! General Kenobi!'
    if [[ $var == $var ]]; then
        printf "~%s~ equals ~%s~\n" "$var" "$var"
    else
        printf "%s doesn't equal %s\n" "$var" "$var"
    fi
}

# - Different strings that are not quoted ARE different arguments. It's not that word splitting is being performed, it's that these different strings
#   are separate arguments! In other words, word splitting is concerned with whether a VARIABLE EXPANSION should be split up or not. It is not
#   concerned with separate string literals
#   - For that reason, this is a syntax error because the [[ operator expects the second argument to be a binary conditional operator, not the string "there"
word_splitting_is_still_implicit_on_separate_string_literals() {
    if [[ Hello there General Kenobi == Hello there General Kenobi ]]; then
        printf "~%s~ equals ~%s~\n" "$var" "$var"
    else
        printf "%s doesn't equal %s\n" "$var" "$var"
    fi
}

#word_splitting_never_occurs_within_bash_keywords
word_splitting_is_still_implicit_on_separate_string_literals
