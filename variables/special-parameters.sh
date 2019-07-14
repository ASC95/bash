# https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables - special shell variables
# https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source


# If a script is executed with "source", $0 expands to the name of the shell.
# If a script is execute with "./", $0 expands to the filename of the script.
# $0 is not reliable. I can't find information online about why sometimes it's "/bin/bash" or "-bash" when a file is sourced. It's not reliable, so
# don't use it for anything
# 
zero() {
    echo $0 # /bin/bash, or -bash, or ./special-parameters/sh, or ./variables/special-parameters.sh, etc.
}

zero