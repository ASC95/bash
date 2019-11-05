#!/usr/bin/env bash

# http://mywiki.wooledge.org/BashGuide/InputAndOutput
# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself

# See exec.sh for more cool stuff

# Examples of weird redirection
# - ./run > /dev/null
#   - Redirect stdout to /dev/null, but don't do anything with stderr
# - ./run > /dev/null 1>&2
#   - Redirect stdout to /dev/null, then redirect stdout again (1>) to whatever stderr points to (&2), which is probably the terminal. The net effect
#     here is no redirections for stdout, since it ends up in the terminal anyway. Nothing at all is done with stderr in this example, so it will
#     appear in the terminal as normal
# - # ./run > /dev/null 2>&1
#   - Redirect stdout to /dev/null, then redirect stderr (2>) to whatever stdout points to (&1) which is /dev/null. The net effect is that stdout and
#     stderr are redirected to /dev/null, which swallows their contents without doing anything

# - "2>&1" is an older syntax than "&>", but they are functionally equivalent. They mean "redirect stdout and stderr to the specified device or file"
#   - If either variation of redirection occurs at the end of a command, the all output is discarded
# - /dev/null is the null device that takes any input and throws it away

# The original command is $ DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" $
# - This will assign the absolute path of the directory containing this script to the variable DIR
# - The entire command isn't strictly necessary to CHANGE to the directory containing the script. I believe that using "${BASH_SOURCE[0]}" alone would
#   be sufficient to cd into the directory (e.g. $ cd "${BASH_SOURCE[0]}")

# File redirection is always processed from left to right
# - In this example, first stdout (1) is changed to so that it points to /dev/null
# - Then, the ">&" syntax duplicates FD 1 (stdout) and puts in into FD 2 (stderr). The end result is that there is a SINGLE file descriptor be used in
#   two places that is writing to the same location (/dev/null)
# - See parser notes for the order of file redirection relative to other commands
# - The net result is that stdout and stderr are discarded.
correct_order() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    printf '%s' "${DIR}" # /Users/austinchang/tutorials/bash/language/file-redirection
}

# - In this example, first stderr (2) is redirected to point to stdout (1) which is the terminal
# - Next, stdout (1) is redirected to point to /dev/null
# - The net result is that stderr started out by pointing to the terminal and never changed!
incorrect_order() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" 2>&1 >/dev/null && pwd )"
    printf '%s' "${DIR}"
}

#correct_order
incorrect_order