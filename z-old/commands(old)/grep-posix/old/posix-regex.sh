#!/usr/bin/env bash

# https://www.regular-expressions.info/posix.html - POSIX Basic regex vs. Extended regex
# https://www.regular-expressions.info/posixbrackets.html - POSIX character class equivalent
# https://stackoverflow.com/questions/15377469/posix-regular-expressions-excluding-a-word-in-an-expression - POSIX ERE are weak vs. PCRE
# https://apple.stackexchange.com/questions/193288/how-to-install-and-use-gnu-grep-in-osx

# TLDR: Don't use POSIX ERE. Just install GNU grep via Homebrew and make my life easier

# [...] are called bracket expressions in POSIX ERE, not character classes.
bracket_expression() {
    # - The '\' character is NOT a metacharacter in a bracket expression. It is the literal '\' character
    string='I am a string 123 look at me \456'
    printf '%s\n' "$string" | egrep -o '[\0-9]+' # 123\n\456
}

# POSIX ERE do have character classes, they are just written a funny way written differently
# - Some of these character classes ALSO have shorthand equivalents 
#   - E.g. \s for whitespace, \d for digits
# - There are 12 official POSIX character classes.
# - There are 2 additional character classes that many POSIX flavors support
#   - macOS doesn't support [:word:] :(
character_classes() {
    # subset of 12 official character classes
    printf '%s\n' 'O n l y a l p h a n u m e r i c c h a r a c t e r s h e r e' | egrep -o '[[:alpha:]]' # equivalent to [a-zA-Z]
    printf '%s\n' 'I am a numb3rs guy' | egrep -o '[[:digit:]]' # equivalent to [0-9]
    printf '%s\n' "Only puct'uation @nd \$ymbols, please?!~<\@%^&*$()(" | egrep -o '[[:punct:]]' # this one is crazy
    printf '%s\n' 'White            space' | egrep -o '[[:space:]]+'
    #printf '%s\n' 'Words are cool' | egrep -o '[[:word:]]'
}

# In order for a quantifier to work the way I want, it needs to go outside of the bracket expression
quantifers() {
    #printf '%s\n' 'AAA BBB CCC DDD' | egrep -o '[[:alnum:]+]' # No
    printf '%s\n' 'AAA BBB CCC DDD' | egrep -o '[[:alnum:]]+' # Yes
}

# POSIX does not have lookarounds :'^(
lookaround() {
    printf '%s\n' 'a1 2' | egrep -o '\d(?<=a)' # Exit code 2
}

#metacharacter_interpretation
#bracket_expression
#character_classes
#quantifers
lookaround