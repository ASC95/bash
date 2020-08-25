#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/11376/what-does-double-dash-mean

# - The -- argument is a special parameter that is guaranteed to be recognized by MOST Bash built-in commands
#   - Do $ type <command> $ to see if a command is built-in or not
#   - $ echo $ is one of the bad Bash commands that is not guaranteed to treat -- correctly
#       - [ is another
# - When a built-in command parses the -- argument, it will treat every subsequent argument as a positional parameter and NOT as an option

x() {
    var='Hello     there General    Kenobi'
    printf '%s' $var
}

x