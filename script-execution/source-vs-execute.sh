#!/bin/bash

# https://superuser.com/questions/176783/what-is-the-difference-between-executing-a-bash-script-vs-sourcing-it

# $ . <script> $ or $ source <script> $ will execute the commands in <script> in the current process (which will be a shell, so it could
# also be called the "current shell process").
source_script() {
    echo ${BASH_SOURCE[0]}
}

# ./<script> $ will execute the commands in <script> in a new process (i.e. a new shell, so it could also be called the "new shell process")
#execute_script() { }

source_script