#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")

# - $ read $ does not write to stdout by itself

# Remember that pipes are ticky because by default the command that is being piped into executes in a child process. If a function is used as the
# command that is being piped into, then the entire function executes in the subprocess. Also note that a child process inherits the stdin and stdout
# of its parent by default!
# - my_var is a global variable when created here, but its only a global within the subprocess
# - This function name is a misnomer. It is IMPOSSIBLE to read a variable in a subprocess and have it exist in the parent process
read_variable_into_current_shell() {
    # This output only appears in current shell because child process inherited stdout
    read my_var && printf '%s\n' "$my_var" 
}

# Note how stdin can be redirected
read_stdin_into_variable() {
    read my_var # Waiting on stdin input until a delimiter (which default to newline) is read
    printf '%s\n' "My var was: ${my_var}"
}

printf '%s\n' 'nice variable!' | { read_variable_into_current_shell ;} && printf '%s\n' "$my_var"
printf '%s\n' 'nice variable!' | { read_variable_into_current_shell && printf '%s\n' "$my_var" ;}

# stdin of read_stdin_into_varible() (which executes in a subshell) was changed to be the stdout of printf. Technically, it was the stdin of the
# subshell that was changed, and the function executed within that subshell
#printf '%s\n' $'what\'s up' | read_stdin_into_variable && printf '%s\n' "My var was: ${my_var}"


#read_stdin_into_variable
#read_stdin_into_variable 0< 'alias.sh'