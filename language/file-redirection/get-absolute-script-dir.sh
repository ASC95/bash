# http://mywiki.wooledge.org/BashGuide/InputAndOutput
# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself

# {BASH_SOURCE[0]} will print the filename of the script. The filename may be prepended with a path, depending on the directory from where the script
# was executed
inspect() {
    echo "${BASH_SOURCE[0]}"
    # $ . get-current-dir $ -> get-current-dir.sh
    # $ ./get-current-dir $ -> ./get-current-dir.sh
    # $ . file-redirection/get-current-dir.sh -> file-redirection/get-current-dir.sh
    echo $( dirname "${BASH_SOURCE[0]}" )
    # $ . get-current-dir $ -> .
    # $ ./get-current-dir $ -> .
    # $ . file-redirection/get-current-dir.sh -> file-redirection
}

# The original command is $ DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" $
# - This will assign the absolute path of the directory containing this script to the variable DIR
# - The entire command isn't strictly necessary to CHANGE to the directory containing the script. I believe that using "${BASH_SOURCE[0]}" alone would
#   be sufficient to cd into the directory (e.g. $ cd "${BASH_SOURCE[0]}")

# File redirection is always processed from left to right
# - In this example, first stdout (1) is changed to so that it points to /dev/null
# - Then, the ">&" syntax duplicates FD 1 (stdout) and puts in into FD 2 (stderr). The end result is that there is a SINGLE file descriptor be used in
#   two places that is writing to the same location (/dev/null)
# - I assume that file redirection is evaluated before other stuff (see parser notes). It's NOT the case that Bash immediately executes commands as it
#   reads a command string from left to right
# - The net result is that stdout and stderr are discarded.
correct_order() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    printf '%s' "${DIR}" # /Users/austinchang/tutorials/bash/language/file-redirection
}

# - In this example, first stderr (2) is redirected to point to stdout (1) which is the terminal
# - Next, stdout (1) is redirected to point to /dev/null
# - The net result is that stderr started out by pointing to the terminal but never changed!
incorrect_order() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" 2>&1 >/dev/null && pwd )"
    printf '%s' "${DIR}"
}

#inspect
#correct_order
incorrect_order