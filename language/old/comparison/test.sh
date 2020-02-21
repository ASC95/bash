#!/bin/bash

# https://ss64.com/bash/test.html - test
# https://mywiki.wooledge.org/BashFAQ/031 - old vs new test
# https://unix.stackexchange.com/questions/72039/whats-the-difference-between-single-and-double-equal-signs-in-shell-compari

# The $ test <expr> $ command evaluates a conditional expression. The test command has two other syntaxes:
# - $ [ <expr> ]: this is known as "old test"
# - $ [[ <expr> ]] $: this is known as "extended test" or "new test" and is preferred to the "old test"

# The opening and closing brackets of old or new test MUST have spaces between them and the arguments to the test command
basic_syntax() {
    # bad spacing
    #if [ "1" = "1"]; then 
    #    echo it was true
    #fi
    # good spacing
    if [ "1" = "1" ]
    then echo it was true; fi
}

word_splitting() {
    var="Hello there"
    # Old test performs word splitting on $var. Hence, 
    #if [ $var = "Hello there" ]; then
    if [ Hello there = "there" ]; then
        echo it was true
    else
        echo it was false
    fi

    if [ "$var" = "Hello there" ]; then
        echo it was true
    else
        echo it was false
    fi
}

#basic_syntax
word_splitting