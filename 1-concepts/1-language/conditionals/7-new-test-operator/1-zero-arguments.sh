#!/usr/bin/env bash

# - https://tiswww.case.edu/php/chet/bash/bashref.html#Conditional-Constructs - describes the new test (i.e. [[ ) operator

# - Providing zero arguments to the new test operator is a syntax error. Good!
syntax_error() {
    [[ ]]
}

syntax_error
