#!/bin/bash

# https://unix.stackexchange.com/questions/199180/prevent-a-command-from-sending-both-stdout-stderr-to-any-terminal-or-file - explains exactly what is
# means when a command ends with "2>&1"
# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
# https://askubuntu.com/questions/350208/what-does-2-dev-null-mean - variations of redirecting

# Redirection
#
#
#
# Examples of of the weird command:
# - ./run > /dev/null
#   - Redirect stdout to /dev/null, but don't do anything with stderr
# - ./run > /dev/null 1>&2
#   - Redirect stdout to /dev/null, then redirect stdout again (1>) to whatever stderr points to (&2), which is probably the terminal. The net effect
#     here is no redirections for stdout, since it ends up in the terminal anyway. Nothing at all is done with stderr in this example, so it will
#     appear in the terminal as normal
# - # ./run > /dev/null 2>&1
#   - Redirect stdout to /dev/null, then redirect stderr (2>) to whatever stdout points to (&1) which is /dev/null. The net effect is that stdout and
#     stderr are redirected to /dev/null, which swallows their contents without doing anything

# I explore special Bash variables in the "language" section of the notes. 

# - "2>&1" is an older syntax than "&>", but they are functionally equivalent. They mean "redirect stdout and stderr to the specified device or file"
#   - If either variation of redirection occurs at the end of a command, the all output is discardedkk
# - /dev/null is the null device that takes any input and throws it away

get_script_dir() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    echo ${DIR}
}

inspect_components() {
    echo ${BASH_SOURCE[0]} # /Users/austinchang/tutorials/bash/common-tasks/get-script-dir.sh
    echo $(dirname ${BASH_SOURCE}) # /Users/austinchang/tutorials/bash/common-tasks
    echo $( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null )
    echo $( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 )

    #echo $(pwd) # /Users/austinchang/tutorials/bash

    #echo "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null

    #DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    #echo ${DIR}
}

#get_script_dir # /Users/austinchang/tutorials/bash/common-tasks
inspect_components