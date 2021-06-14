#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - https://remram44.github.io/regex-cheatsheet/regex.html - regular expression syntax comparison

# - Fun fact, Vim has it's own syntax separate from BRE, ERE, and PCRE! Horrible!

# - grep has three different regular expression syntaxes:
#   - Basic regular expression (BRE) syntax is the least powerful and is the default syntax
#   - Extended regular expression (ERE) syntax is more powerful, but can only be used on systems that have it
#   - Perl compatible regular expression (PCRE) syntax is the most powerful, but can only be used on systems that have it
# - On Ubuntu, I can use PCRE if I want, but BRE is still the default

# - Remember that grep only needs to find a match to return the matching line. The entire line does not need to match!

# - The -P flag must be used to enable PCRE syntax
# - Only PCRE syntax enables lookarounds of any kind
# - Without any flags, I get the behavior of BRE syntax. Therefore, GNU grep uses BRE syntax by default!
use_positive_lookahead_with_pcre() {
    # - With the -P flag, PCRE syntax matches "remram" from the line: "https://remram44.github.io/regex-cheatsheet/regex.html - regular expression syntax comparison"
    # - With the -G flag, BRE syntax matches "w+(?=44)" because "w" is an alphanumeric character that the "+(?=44)" string is matched literally
    #   - The one-or-more quantifier (i.e. "+") must be written as "\+" in BRE syntax. That's why "+" is matched literally in this example
    # - With the -E flag, ERE syntax matches nothing because there is no string where one or more alphanumeric characters are IMMEDIATELY followed by
    #   the literal string "(?=44)". The string (?=44) appears multiple times in this file, but in no situation is it preceeded immediately by an
    #   alphanumeric character!
    grep -P '\w+(?=44)' regular-expression-syntax-variations.sh
}

# - BRE, ERE, and PCRE all use the "^" character to search from the beginning of a line
search_from_beginning_of_line() {
    # - With the -P, -G, or -E flags, this matches "use_positive_lookahead_with_pcre() {"
    grep '^us' regular-expression-syntax-variations.sh
}

# - BRE, ERE, and PCRE all use "\b" for a word boundary
#   - Annoyingly, many online tutorials state that that I should use "\<" for the beginning of a word and "\>" for the end of a word. However, this
#     syntax only works for BRE and ERE
search_word_boundary() {
    # - With the -P, -G, or -E flags, this matches the same lines within this file
    grep '\bus' regular-expression-syntax-variations.sh
}

#use_positive_lookahead_with_pcre
#search_from_beginning_of_line
search_word_boundary