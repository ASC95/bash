#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - https://disconnected.systems/blog/another-bash-strict-mode/ - describes unofficial Bash strict mode
# - http://mywiki.wooledge.org/BashFAQ/105 - shows that the corner cases that $ set -e $ introduces are worse than the problems it tries to solve

# - The goal of Bash "strict mode" is to make Bash fail faster so it's easier to debug

# - $ set -o pipefail: the exit status of a $ <cmd_1> | <cmd_2> | etc. $ pipeline is the status of the last command in the pipeline to exit with a
#   non-zero status
#   - By default, the exit status of a pipeline is always that of the last command, regardless of whether other commands failed. This command makes
#     pipeline errors more transparent

#   - However, the pipeline won't necessarily terminate immediatley when it encounters a non-zero exit code
#       - That will only happen if $ set -e $ is run or if a command triggers a fatal error (e.g. use $ set -u)

# - $ set -o pipefail $ does not make the script exit if the pipeline exits with a nonzero exit code
set_o_is_good() {
    set -o pipefail
    # - I am correctly notified of a failure with $ set -o pipefail
    {
        grep 'no' 'nope.txt' | sort && echo 'success!'
    } || echo 'failure!'
}

I DONT UNDERSTAND SOMETHING ABOUT PIPES. WHY ISNT THE UNSET VARIABLE CAUSING THE ENTIRE SCRIPT TO FAIL?

# - $ set -u: script exits if the programmer attemps to expand/substitute an unset variable 
#   - Yes the script exits just because of -u. $ set -e $ is not required
#   - I even get a nice line number error!
set_u_is_good() {
    set -u
    #echo "$foo"
    #echo "$foo" | grep 'hi'
    grep 'hi' 'foo.txt' | echo "$foo"
    echo 'all done'
}

# - $ set -e $ introduces a bunch of corner cases that are explained in the second source. 
# - The worst part is that the option doesn't tell me where my script fails, the script just fails without any line number
#   - This is mitigated by 
set_e_is_bad() {
    #set -e
    trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR
    echo 'getting started'
    i=0
    ((i++))
    echo "$i" 
    echo 'all done'
}


#set_o_is_good
set_u_is_good
#set_e_is_bad
