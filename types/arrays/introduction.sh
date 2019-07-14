# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself


# BASH_SOURCE is a Bash-specific variable that is the (possibly relative) filepath of the currently executing script. It is not in POSIX.
get_filename() {
    echo $0
}

get_filename