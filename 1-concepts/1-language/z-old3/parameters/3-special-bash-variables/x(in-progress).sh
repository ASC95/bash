# - https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html

# - The $BASH_COMMAND variable is the COMMAND that is currently executing, NOT the executable that is currently executing
#   - Its behavior is super confusing and is only remotely useful during a trap
#   - In the case of a pipe, $BASH_COMMAND always contains the LAST command
examine_currently_executing_command() {
    #echo "$BASH_COMMAND" # echo "$BASH_COMMAND"
    #BASH_COMMAND='foo'
    #echo "$BASH_COMMAND" # echo "$BASH_COMMAND"

    #grep 'no' 'no.txt' | sort
    #grep "$no" 'no.txt' | sort
    #echo "$hi"
    echo 'whatever' | grep "$not_here"
    echo "$?"
    echo 'All done!'
}