#!/usr/bin/env bash

# - http://mywiki.wooledge.org/WordSplitting?highlight=%28word%29%7C%28splitting%29 - describes word splitting

# - Word splitting is the process by which the parser determines whether a the contents of a SINGLE variable should be divided into MULTIPLE arguments
#   for a command
# - All of these notes apply to the normal Bash parser context (i.e. a context that is not within a Bash keyword nor part of an assignment expression,
#   nor a few other exceptions)

cd "$(dirname "${BASH_SOURCE[0]}")"

# - If a variable is not quoted, then its contents will undergo word splitting
#   - In this example, the variable contains whitespace delineated strings. Since the IFS variable defaults to whitespace, the larger string is split
#     into separate arguments before it is passed to the command. This splitting doesn't HAVE to occur, but it does because the variable wasn't quoted
word_splitting_is_always_done_on_unquoted_variables() {
    var='Hello there! General Kenobi!'
    #var="Hello there! General Kenobi!"
    printf '~%s~ ' $var # ~Hello~ ~there!~ ~General~ ~Kenobi!~ 
}

# - If a variable is quoted (in double quotes), then its contents will NOT undergo word splitting
#   - In this example, it doesn't matter that the variable contained a string with whitespace. The string was not split into smaller strings because
#     the variable was double quoted
#   - Single quotes always restrict a string to being interpreted literally, so it doesn't make sense to talk about them with regard to word splitting
word_splitting_is_never_done_on_quoted_variables() {
    var='Hello there! General Kenobi!'
    #var="Hello there! General Kenobi!"
    printf '~%s~ ' "$var" # ~Hello there! General Kenobi!~
}

# - Word splitting always occurs before glob patterns are expanded into matching filenames
#   - This can produce unexpected results apparently
pathname_glob_expansion_happens_after_word_splitting() {
    var='*.s? *.sh'
    printf '~%s~ ' $var # ~1-normal-context.sh~ ~2-keyword-context.sh~ ~3-assignment-context-variable-expansion.sh~ ~4-array-context.sh~ ~1-normal-context.sh~ ~2-keyword-context.sh~ ~3-assignment-context-variable-expansion.sh~ ~4-array-context.sh~ 
    echo ''
    printf '~%s~ ' "$var" # ~*.s? *.sh~
}

#word_splitting_is_always_done_on_unquoted_variables
#word_splitting_is_never_done_on_quoted_variables
pathname_glob_expansion_happens_after_word_splitting
