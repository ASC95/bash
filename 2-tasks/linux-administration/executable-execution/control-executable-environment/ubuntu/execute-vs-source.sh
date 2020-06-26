#!/bin/bash

# https://superuser.com/questions/176783/what-is-the-difference-between-executing-a-bash-script-vs-sourcing-it - "." vs "./"
# https://unix.stackexchange.com/questions/136547/what-is-the-difference-between-running-bash-script-sh-and-script-sh?rq=1 - "./" vs "bash", also
# details about program loading
# https://www.gnu.org/software/bash/manual/html_node/Shell-Scripts.html#Shell-Scripts
# https://unix.stackexchange.com/questions/421020/what-is-the-exact-difference-between-a-subshell-and-a-child-process - subshell vs. child process
# https://stackoverflow.com/questions/21063765/why-is-returning-the-same-id-as-the-parent-process/21063837#21063837 - what does "$$" mean?

# Subshell

# - Strictly speaking, a subshell is simply a separate shell execution environment that was created as a duplicate of its parent environment. Changes
#   to the subshell environment do not affect the parent environment. Traditionallly, a subshell is created by forking a child process. However, the
#   specification does not require that an implemention must fork a child process to create a subshell environment. Some shells like ksh88 use
#   optimizations to avoid forking when possible because it is an expensive operation. In summary, it is safe to assume that a "subshell" and a forked
#   child process are equivalent in most contexts.

# Script execution

## Execution stages

# - When a script is executed, the following happens:
#   1) Bash searches $PATH for the script
#   2) When it finds the script, it spawns a subshell to execute the script. The subshell is a copy of the parent's execution environment, so it has
#      all of the same environment variables and the like. Any changes to the subshell's environment will not affect the parent environment
# - A script can be executed by:
#   - $ ./<filename>.sh
#   - $ <filename>.sh 
#       - This is equivalent to $ bash <filename>.sh $ in terms of the fact that the script is being executed
#       - This will only work if the script is located in $PATH somewhere. If it isn't then Bash will complain that the command wasn't found

## Execution permissions

# - $ ./<filename>.sh $ requires execution and readable bits to be set because the file is executed as a regular executable
#   - That means the script itself is forwarded to program loader, where the script will tell the system (via "#!/bin/bash") how the script itself
#     should be interpreted
#       - The program loader will execute /bin/bash and pass <filename>.sh to bash as a command-line argument. 
# - $ bash <filename>.sh $ only requires the readable bit to be set because the shell runs bash and passes <filename>.sh as a command-line argument
# - So what's the difference? The first way ensures that the correct interpreter will always be called for a script (e.g. if it's an awk script, then
#   the first line would be #!/usr/bin/awk). The second way will only ever use bash to execute the script.

# Script sourcing

# - Sourcing a script is different from executing a script
# - Sourcing a script will execute the script in the current shell process, and thus will use and modify the current shell environment.
# - A script can be sourced by:
#   - $ . <filename>.sh
#   - $ source <filename>.sh $ ("source" is a Bash alias for ".")

# Examples

# - When this script function is executed, the output is different every time
#   - "$", which is expanded to its value with "$$" (same as all other variables), contains the process ID of the top-most parent shell
#   - When this script is executed, a new bash program/shell is started and it runs the script. Since a new bash program/shell is created every time,
#     the value of "$" is different every time
# - When this script is sourced, the output is the same every time. Also, the output of this function is identical to the output of typing "$$" in the
#   current terminal
#   - When this script is sourced, this script/function is executed in the current shell. Since the current shell is the same every time, the value
#     of "$" is the same every time
display_topmost_shell_pid() {
    echo $$
}

# - "$" in any number of nested subshells always expands to the same value. This is because when "$" is expanded in a subshell, it contains the value
#   of the invoking parent shell, NOT the subshell itself!
#   - If this function is executed, then "$" will always contain the new PID of the newly created bash shell/process
#   - If this function is sourced, then "$" will always contain the PID of the current shell
# - Recall that:
#   - "$(<commands>)" performs command substitution
#       - Command substitution evaluates <commands> in a subshell (YES A SUBSHELL) and formats the stdout of <commands> into a string and replaces
#         "$(<commands>)" with that string in the invoking shell
#       - Recall that command substituion removes trailing newlines from the stdout of $(<commands>)
#   - "(<commands>)" performs subshell grouping
#       - This is DIFFERENT from command substitution. Subshell grouping merely 1) creates a subshell 2) executes <commands> as a unit in the subshell
#           - The stdout of <commands> is not returned in any way to the invoking shell
#       - Examples of usage: 1) applying redirection(s) to all <commands> 2) run all <commands> as a background process
display_topmost_shell_pid_in_subshell() {
    printf '%s\n' $$
    (printf '%s %s\n' $$ $$)
    printf '%s %s' $(printf '%s %s' $$ $$)
}

# - Set the FOO environment variable with $ export FOO='My foo'
#   - When this script is executed, FOO will remain "My foo" because the subshell in which this script was executed cannot modify the parent environment
#   - When this script is sourced, FOO will be changed to "New foo" because the script was executed in the very same shell process
display_foo() {
    printf '%s\n' "This shell contains the value \$FOO=$FOO"
    export FOO="New foo"
}

#display_topmost_shell_pid
#display_topmost_shell_pid_in_subshell
display_foo