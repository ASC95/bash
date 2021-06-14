#!/usr/bin/env bash

# - https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps - bash history tutorial
# - https://unix.stackexchange.com/questions/105882/how-to-get-an-specific-amount-of-lines-in-the-console-with-less - it's not possible to limit the
#   output of $ less $ to part of the terminal window, but I shouldn't need to do that anyway
# - https://unix.stackexchange.com/questions/373461/open-less-scrolled-to-the-end - use $ less $ but start from end of file

# This command is actually quite complex

# - Command: $ history
# - Arguments:
#   - <number>
#       - Restrict the history command to showing the last <number> commands
# - Options:
# - Notes:
#   - This command works within a script just fine
view_history() {
    history
}


# - Command: $ history | less +G <file>
# - Options:
#   - +: run the command when the file is opened
#   - G: vim command to jump to end of file
# - Notes:
#   - $ head $ and $ tail $ are less useful then $ less $ because their output isn't scrollable
limit_history_window_size() {
    history | less +G
}

# - Command:
#   - $ !<history number>
#   - $ !-<history number>
# - Options:
# - Notes:
#   - This command doesn't work from within a script
#   - In this first form, the most recent command has the highest numerical id
#   - In the second form, the number represents how far back to go from the current command
#       - $ !-0 $ is not possible. Use $ !! $ to repeat the most recent command
execute_past_command() {
    # Execute the 500th command executed since the shell session started
    #!500
    # Execute the command BEFORE the last command
    #!-1
    # Execute the last comand
    !!
}

#view_history
limit_history_window_size
#execute_past_command
