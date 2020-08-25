#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Conditional-Constructs - describes the new test (i.e. [[ ) operator

# - I MUST read 1-language/parser/word-splitting/2-keyword-context.sh as part of the reading order for this section

# - Providing zero arguments to the new test operator is a syntax error. Good!
syntax_error() {
    [[ ]]
}

syntax_error
