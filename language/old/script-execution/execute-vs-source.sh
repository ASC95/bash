#!/bin/bash

# https://superuser.com/questions/176783/what-is-the-difference-between-executing-a-bash-script-vs-sourcing-it - "." vs "./"
# https://unix.stackexchange.com/questions/136547/what-is-the-difference-between-running-bash-script-sh-and-script-sh?rq=1 - "./" vs "bash", also
# details about program loading
# https://www.gnu.org/software/bash/manual/html_node/Shell-Scripts.html#Shell-Scripts
# https://unix.stackexchange.com/questions/421020/what-is-the-exact-difference-between-a-subshell-and-a-child-process - subshell vs. child process

# Script execution

# Subshell

# Strictly speaking, a subshell is simply a separate shell execution environment that was created as a duplicate of its parent environment. Changes to
# the subshell environment do not affect the parent environment. Traditionallly, a subshell is created by forking a child process. However, the
# specification does not require that an implemention must fork a child process to create a subshell environment. Some shells like ksh88 use
# optimizations to avoid forking when possible because it is an expensive operation. In summary, it is safe to assume that a "subshell" and a forked
# child process are equivalent in most contexts.

# Execution stages

# When a script is executed, the following happens: 1) Bash searches $PATH for the script 2) when it finds the script, it spawns a subshell to execute
# the script. The subshell is a copy of the parent's execution environment, so it has all of the same environment variables and the like. Any changes
# to the subshell's environment will not affect the parent environment. A script can be executed by:
# - $ ./<filename>.sh
# - $ <filename>.sh 
#   - This is equivalent to $ bash <filename>.sh $ in terms of the fact that the script is being executed
#   - This will only work if the script is located in $PATH somewhere. If it isn't then Bash will complain that the command wasn't found

# Execution permissions

# - $ ./<filename>.sh $ requires execution and readable bits to be set because the file is executed as a regular executable. That means the script
#   itself is forwarded to program loader, where the script will tell the system (via "#!/bin/bash") how IT should be interpreted, and program loader
#   will execute /bin/bash and pass <filename>.sh as a command-line argument. 
# - $ bash <filename>.sh $ only requires the readable bit to be set because the shell runs bash and passes <filename>.sh as a command-line argument
# - So what's the difference? The first way ensures that the correct interpreter will always be called for a script (e.g. if it's an awk script, then
#   the first line would be #!/usr/bin/awk). The second way will only ever use bash to execute the script.

# Script sourcing

# Sourcing a script will execute the script in the current shell process, and thus will use and modify the current shell environment. A script can be
# sourced by:
# - $ . <filename>.sh
# - $ source <filename>.sh $ ("source" is a Bash alias for ".")

# When this script is executed, the PID is different every time. When this script is sourced, the PID is the same every time.
display_pid() {
    echo $$
}

# When this script is executed, FOO will remain "My foo" because the subshell in which this script was executed cannot modify the parent environment.
# When this script is sourced, FOO will be changed to "New foo" because the script was executed in the very same shell process.
display_foo() {
    echo FOO was $FOO
    export FOO="New foo"
}

display_pid
#display_foo