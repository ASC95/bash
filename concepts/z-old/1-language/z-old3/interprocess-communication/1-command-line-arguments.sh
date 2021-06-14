#!/usr/bin/env bash

# - Invoke this script as $ . 1-command-line-arguments.sh foo bar baz

# - Command-line arguments are never implicitly passed to functions
command_line_args_dont_exist_in_functions() {
    printf 'Function positional arg: ~%s~\n' "$1" "$2" "$3" # ~~ ~~ ~~
}

# - Command-line arguments are accessible in a script via positional parameters in the outermost scope
#   - See bash/1-concepts/1-language/parameters/1-positional-parameters.sh
printf 'Command-line arg: ~%s~\n' "$1" "$2" "$3" # ~foo~ ~bar~ ~baz~
command_line_args_dont_exist_in_functions