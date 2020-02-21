#!/usr/bin/env bash

# https://mywiki.wooledge.org/BashGuide/TestsAndConditionals - lots of good examples, expecially with the exact syntax for all the different comparisons
# https://ss64.com/bash/test.html - easier to read
# https://unix.stackexchange.com/questions/306111/what-is-the-difference-between-the-bash-operators-vs-vs-vs - extended test vs test

# https://stackoverflow.com/questions/10733317/whats-a-null-string-in-bash - null string
# https://serverfault.com/questions/7503/how-to-determine-if-a-bash-variable-is-empty - unset vs null string and checking them

# Extended test is a shell keyword, unlike test which is a shell built-in command. Why does this matter?
# - A keyword parses its arguments before they are expanded by Bash and does the expansion itself
# - It takes the result of this internal expansion as a single argument, even if the result contained whitespace
#   - Thus, extended test does NOT allow word-splitting of its arguments. This means than an variable whose value contains whitespace does NOT need to
#     be double-quoted. However, simple strings still need to be quoted as the internal expansion rules are the same as Bash's in that regard
#
# I should always double quote my variables regardless
builtin_vs_keyword() {
    color='red and blue'
    #if [ $color = $color ]; then # [ is a built-in, so the variable is expanded and subject to word-splitting since it isn't quoted
    #    echo 'true!'
    #else
    #    echo 'false!' # false!
    #fi
    if [[ $color = $color ]]; then # [[ is a keyword, so it performs its own expansion
        echo 'true!' # true!
    else
        echo 'false!'
    fi
    #if [[ I like $color = I like $color ]]; then # [[ still treats regular strings the same, so this is bad syntax
    #    echo 'true!'
    #else
    #    echo 'false!'
    #fi
    if [[ "I like $color" = "I like $color" ]]; then # I should always write my comparisons this way
        echo 'true!' # true!
    else
        echo 'false!'
    fi
}

# If the right-hand side of an extended test equality comparison is not quoted, extended test performs pattern matching (with globing) instead of
# equality comparison
pattern_matching() {
    # This is pattern matching with globbing
    if [[ cat = cat* ]]; then echo 'true!'; else echo 'false!'; fi # true!
    # This is also pattern matching
    if [[ cato = cat[acomb] ]]; then echo 'true!'; else echo 'false!'; fi # true!
    # This is string equality comparison
    if [[ cato = "cat[acomb]" ]]; then echo 'true!'; else echo 'false!'; fi # false!
}

# A null string is a string whose length is 0. This is true, trust me.
# - The -z check will return true if the variable is null or unset. It is NOT sufficient for checking WHETHER a variable is unset or not
null_string_check() {
    null=''
    if [[ -z "$null" ]]; then echo 'string is null string'; else echo 'string is not null string'; fi # string is null string
    if [[ -z "$nothing" ]]; then echo 'string is null string'; else echo 'string is not null string'; fi # string is null string
}
#builtin_vs_keyword
#pattern_matching
null_string_check