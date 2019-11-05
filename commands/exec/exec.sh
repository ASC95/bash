#!/usr/bin/env bash

# https://askubuntu.com/questions/525767/what-does-an-exec-command-do
# https://bash.cyberciti.biz/guide/Reads_from_the_file_descriptor_(fd)

cd "$( dirname "${BASH_SOURCE[0]}" )"

# $ exec <command> $ replaces the current shell process with <command>
# - Thus, if I control-D (signal EOF) to the new process, the process will terminate. Then, I WON'T go back to the previous shell session, because
#   that session doesn't exist anymore
start_new_process() {
    #exec bash
    exec python
}

# If no command is supplied to exec, then any redirections are simply made to apply to the entire shell session
# - This is opposed to the normal redirection behavior, which only applies to a single command or single group of commands
apply_redirections_to_shell() {
    exec 22> output.txt # file descriptor 713 now will output to output.txt for the entire shell process
    printf '%s\n' 'This is some cool data, is it not?' >&22 # redirect stdout to point to fd 713
    exec 22<&- # close fd 22
    #printf '%s\n' 'This will always fail' >&22 # fd 22 is closed, so this fails
}

#start_new_process
apply_redirections_to_shell