#!/bin/bash

# https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html - all special parameters
# https://unix.stackexchange.com/questions/76354/who-sets-user-and-username-environment-variables - who sets $USER
# https://stackoverflow.com/questions/17368067/length-of-string-in-bash
# https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Parameter-Expansion - how does ${#<var>} really work? (search "${#parameter}")

# The shell has 9 special parameters that are read-only in any scope
# - Bash has its own set of special variables that no other shell has. Those are different from the special parameters described here

current_shell_process_id() {
    printf '%s\n' "Process ID: $$" # 11209
}

exit_status_of_last_foreground_pipeline() {
    printf '%s\n' "Exit code of last foreground pipeline: $?" # 0
}

# Technically, $USER is an environment variable, not a special shell variable. The 'login' utility sets $USER, $HOME, $SHELL, $PATH, $LOGNAME, and
# $MAIL
current_shell_user() {
    printf '%s\n' "User ID: $USER" # austinchang
}

# See the array introduction notes for the differences between "$*" and $"@"
# - Always use double quotes when expanding an array
star_all_positional_parameters() {
    printf '%s\n' "$*"
}

# See the array introduction notes for the differences between "$*" and $"@"
# - Always use double quotes when expanding an array
at_all_positional_parameters() {
    printf '%s\n' "$@"
}

# '#' is the length operator. Technically, it expands to the number of positional parameters in decimal
# - string_length receives 5 positional arguments, so $# expands to 5
# - ${#<var>} expands to the length in characters (NOT bytes) of the expanded value of <var>
#   - It's also possible to use $ wc -c $
string_length() {
    var='hello world'
    printf '%s\n' ${#var} # 11
    printf '%s\n' $#'hi' # 5hi
}

#star_all_positional_parameters 'first arg' 'second-arg' 'third    arg'
#at_all_positional_parameters 'first arg' 'second-arg' 'third    arg'
string_length 'foo' 'bar' 'baz' 'bash' 'bin'