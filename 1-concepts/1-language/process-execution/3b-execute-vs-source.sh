#!/usr/bin/env bash

display_topmost_shell_pid() {
    echo $$
}

display_topmost_shell_pid_in_subshell() {
    printf '%s\n' $$
    (printf '%s %s\n' $$ $$)
    printf '%s %s' $(printf '%s %s' $$ $$)
}

# - Set the FOO environment variable with $ export FOO='My foo'
display_foo() {
    printf '%s\n' "This shell contains the value \$FOO=$FOO"
    export FOO="New foo"
}

#display_topmost_shell_pid
#display_topmost_shell_pid_in_subshell
display_foo