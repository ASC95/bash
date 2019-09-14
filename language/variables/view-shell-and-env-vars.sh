# https://unix.stackexchange.com/questions/3510/how-to-print-only-defined-variables-shell-and-or-environment-variables-in-bash - using set
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html - set tutorial page
# https://www.tldp.org/LDP/abs/html/options.html - -o vs. +o 

# https://askubuntu.com/questions/275965/how-to-list-all-variables-names-and-their-current-values

# env or printenv will print out environment variables. Use env because it has more functionality than printenv. printenv ONLY prints out environment
# variables while env can do more
view_env_variables() {
    env
}

# Without arguments, $ set $ prints out all shell variables, all shell functions, and all environment variables. This is not Posix mode (it's off by default)
view_everything() {
    set
}

# Do this when I don't want to see functions
view_shell_and_environment_variables() {
    set -o posix; # Set the option for $ set $ to posix. -o means enable the option
    set; # Actually run $ set $
    set +o posix; # Disable the posix option for $ set $
}

# This command is similar to the one above, except that it creates and runs set in a subshell
view_only_shell_variables_compact() {
    (set -o posix; set;)
}