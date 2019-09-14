#!/bin/bash

# https://unix.stackexchange.com/questions/3747/understanding-the-exclamation-mark-in-bash - $!
# https://unix.stackexchange.com/questions/85021/in-bash-scripting-whats-the-meaning-of - what is $!
# https://serverfault.com/questions/208265/what-is-bash-event-not-found
# https://unix.stackexchange.com/questions/33339/cant-use-exclamation-mark-in-bash - why echo "$!" doesn't work in the shell (mug896)

# In the interactive shell, the "!" character will display previous user commands. The specific commmands that will be displayed depend on the
# variation of the "!" command that was used. ALL "!<something>"" history commands are disabled in shell scripts and (possibly) enabled in the
# interactive shell.
# - It wouldn't make sense to access the history of anything in a shell script

# echo ! vs. echo "!" in the interactive shell
#
# These notes should really go in the parser directory, but I'll leave them here for convenience. The Bash parser does several things before any
# commands are looked up or run. One of the first things the parser does is process double-quoted content specially. Within "<content>", ALL
# characters except for $, ", ` and \ LOSE any special meaning that they have. So in any execution context, "!" is just a plain old regular
# exclamation point literal at this stage in the parser's processing.
# I don't know.... :^(

limited_history_commands() {
    #history # this works because it doesn't fall under the "!<someting>" group of history commands
    echo "$!" # this works because $! is a special parameter.
    ls
    echo !ls # This literally prints the string "!ls" instead of executing the most rececent command that started with the substring "ls", as it does in the shell
}

# If no background process was launched in the current shell's history, "$!" is nothing/null/???
view_most_recent_background_process_id() {
    sleep 10 &
    # Both of these work in this script, but $ echo "$!" $ doesn't work in the interactive shell! Why?
    echo $! # 5744
    echo "$!" # 5744
}

#no_history_commands
view_most_recent_background_process_id