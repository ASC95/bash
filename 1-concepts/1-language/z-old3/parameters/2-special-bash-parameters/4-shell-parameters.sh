#!/usr/bin/env bash

# - http://mywiki.wooledge.org/BashGuide/InputAndOutput - main guide on redirection
# - https://askubuntu.com/questions/368509/why-is-0-set-to-bash - "-bash" vs "bash" (i.e. login vs non-login shell)
# - https://bash.cyberciti.biz/guide/$0 - $0 parameter

# - "$-" expands to the current option flags as specified upon invocation via $ set $ or via the shell itself
# - On my machine by default:
#   - "$-" expands to "hB" in a script
#       - h: remember the location of commands as they are looked up
#       - B: perform brace expansion
#   - "$-" expands to "himBHs" in an interactive terminal
#       - i: $ set --help $ doesn't have this option, but I think it's the interactive flag
#       - m: job control is enabled
#       - H: enable !<num> history substitution
#       - s: $ set --help $ doesn't have this option
get_shell_options() {
    #set -u
    #set -o pipefail
    printf '%s\n' "$-" # hB
}

# - $0 can expand to many different things, depending on what the shell sets it to
#   - See bash/1-concepts/1-language/process-execution/3a-execute-vs-source.md
#   - Normally, $0 expands to the name of the running shell or shell script (e.g. "bash")
#   - If the Bash executable (i.e. /bin/bash) is directly invoked with a file of commands, then $0 is set to the path/name of the file
examine_0_parameter() {
    # - $0 == "bash" when the script is sourced
    # - $0 == "<relative path from execution dir>" when the script is executed (e.g. "./4-shell-parameters.sh")
    printf '%s\n' "$0"
}


# - If I try to use $0 within a function, it is still a special parameter
this_is_a_function() {
    # $0 is the same within a function
    printf '$0 was: %s\n' "$0"
    printf '$1 was: %s\n' "$1"
}

#get_shell_options
examine_0_parameter
#this_is_a_function 'whoa'
