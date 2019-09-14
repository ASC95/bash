#!/bin/bash

# https://serverfault.com/questions/548320/override-path-to-binary-for-particular-user

# - My $PATH: /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# - Make sure to source this file instead of executing it

# To replace a binary, I can:
# - Create an alias for the binary
#   - Doesn't work if I want to alias a path
# - Append the directory containing the binary to the start of $PATH so that it takes precedence over the outdated binary in some other directory
#   - Only works if I'm replacing a binary without a path component
# - Backup the old binary and create a link to the new binary. The link will have the same path as the old binary which has been backed up
#   - Annoying, but will work
# - Create a function whose signature is a path, and export that function to the shell
#   - Works on macOS, but not Debian. I don't know why.

# My goal is to replace the flask binary that is located in /usr/local/bin. I must export the function to the environment. In order to $ export $ a
# function, the -f option must be used
# IT REALLY WORKS on macOS at least.
/usr/local/bin/flask() {
    sudo echo 'I replaced the /usr/local/bin/flask binary in this shell!'
}
#export -f /usr/local/bin/flask

/usr/local/bin/python() { 
    echo 'hi from python'
}
#export -f /usr/local/bin/python

# In Debian, this function exports just fine. However, functions with "/" characters do NOT export in Debian.
some_/func() {
    echo 'hello from some_func'
}
#export -f some_func
#export -f "some_/func"