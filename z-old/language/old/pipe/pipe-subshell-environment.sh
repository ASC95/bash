#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - $ read $ does not write to stdout by itself

# Remember that pipes are ticky because by default the command that is being piped into executes in a child process. If a function is used as the
# command that is being piped into, then the entire function executes in the subprocess. Also note that a child process inherits the stdin and stdout
# of its parent by default!
# - my_var appears to be a global variable in the current shell context. However, since this entire function is executed within a subprocess, my_var
#   is not a global variable in the current shell context
# - This function name is a misnomer, but only due to the way this function is called. It is IMPOSSIBLE to read a variable in a subprocess and have it
#   exist in the parent process
read_variable_into_current_shell() {
    # This output only appears in current shell because child process inherited stdout, not because the variable is set in the current_shell context
    read my_var && printf 'Inside the function, my_var is: %s\n' "$my_var" 
}

# printf executes in the current shell context, so my_var is unset
printf '%s\n' 'nice variable!' | { read_variable_into_current_shell ;} && printf 'Outside the function, my_var is: %s\n' "$my_var"
printf '%s\n'

# printf executes in the same subshell, so my_var is visible there
printf '%s\n' 'nice variable!' | { read_variable_into_current_shell && printf 'Outside the function, my_var is: %s\n' "$my_var" ;}
printf '%s\n'

read_stdin_into_variable() {
    read my_var # Waiting on stdin input until a delimiter (which defaults to newline) is read
    printf '%s\n' "Inside the function, my_var is: ${my_var}"
}

# stdin of read_stdin_into_varible() (which executes in a subshell) was changed to be the stdout of printf. Technically, it was the stdin of the
# subshell that was changed, and the function executed within that subshell
# - && deliniates a completely separate command, so the pipe context doesn't apply to printf
printf '%s\n' $'what\'s up' | read_stdin_into_variable && printf '%s\n' "In current shell context, my_var is: ${my_var}"