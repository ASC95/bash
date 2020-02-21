#!/usr/bin/env bash

# Works as expected
variable_value_without_spaces() {
    nospaces=foobar
    printf '%s\n' "$nospaces" # foobar
    printf '%s\n' $nospaces # foobar
}

# A variable can be assigned to a value that contains spaces, so long as the value is quoted. This is orthogonal to how the variable may be referenced
# later on
variable_value_with_spaces() {
    spaces="foo bar"
    printf '%s\n' "$spaces" # foo bar
    printf '%s\n' $spaces # foo\nbar
}

single_line_correct_assignemnt() {
    # NAME is set in an entirely separate command, so it is a regular variable
    NAME=sam; echo "$NAME" # sam
    # Same as above
    NAME=sam && echo "$NAME" # sam
}

# If I assign a variable to an unquoted value with spaces, then I'm actually 1) creating and passing a single-command environment variable and 2)
# invoking subsequent tokens as commands, which may or may not raise errors
# - This is incorrect when I'm trying to assign a normal variable in Bash
single_line_incorrect_assignment() {
    # This is good because I get an error
    #spaces=foo bar # bar: command not found
    # This is bad because there's no error. Also, $spaces is unset because spaces=foo only ever created a single-command environment variable
    spaces=foo ls
    printf 'spaces was: %s\n' "$spaces"
    printf 'spaces was: %s\n' $spaces
    # NAME is a single-command environment variable, not a regular variable, so $NAME is unset
    NAME=sam echo "$NAME" # ""
}

#variable_value_without_spaces
#variable_value_with_spaces
#single_line_correct_assignemnt
single_line_incorrect_assignment
