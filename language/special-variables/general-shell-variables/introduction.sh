#!/bin/bash

# https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html - all special parameters
# https://unix.stackexchange.com/questions/76354/who-sets-user-and-username-environment-variables - who sets $USER

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

#star_all_positional_parameters 'first arg' 'second-arg' 'third    arg'
at_all_positional_parameters 'first arg' 'second-arg' 'third    arg'