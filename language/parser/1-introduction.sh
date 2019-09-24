#!/bin/bash

# - http://mywiki.wooledge.org/BashParser - THIS is the introduciton page with the order of parser operations. The bottom of this page has a table of
#   contents
# - https://tiswww.case.edu/php/chet/bash/bashref.html - This is an in-depth manual on the Bash parser itself. It is more detailed than
#   the earlier link. It is brief compared to the actual Bash manual!

# The parser performs all of these steps line-by-line, and within each line, command-by-command. That means that Bash immediately processes and
# executes every line and every command within a line that it finds
#
# Part A
# - 1a) Bash reads my code line-by-line. If a line ends with a backslash '\', then Bash will also read the next line before applying the parser
#   processing
# - 2a) Process quotes. When Bash scans the line and finds a quote, all subsequent characters in the line are in a quoted state until then next
#   matching quote is found. Bash will pause and wait for more input if a quote isn't terminated. Once Bash has finished processing quotes to
#   determine the quoted state of other characters (and it remembers this state going forward), the quotes are removed for all subsequent steps from
#   the input line.
#   - If double quotes "" were used, all characters except for $, ", `, and \ lose any special meaning. 
#   - If single quotes '' were used, all characters except for ' lose any special meaning
# - 3a) Split the processed input into separate commands
#   - Commands are deliniated by the ; character, so long as it has not been escaped by quotes in the previous step!
# 
# Part B
# For each command that was identified during part A, the following processing occurs:
# - 1b) Parse special operators. Bash will inspect the command to see if it contains any special operators, and will process them in a specific order.
#   Almost all operators are evaluated and then replaced with the result of the evaluation, except for redirection operators (which are removed from
#   the command-line).

#   - What are the operators?

# - 2b) Perform expansions of various types. The order of expansions is:
#  - 1) Brace expansion: {..}
#  - 2) Tilde expansion: ~<something>
#    - Just ~ is replaced by $HOME
#  - 3) Variable expansion: ${}
#  - 4) Arithmetic expansion
#  - 5) Command substitution (done in a left-to-right fashion);
#  - 6) Word splitting
#  - 7) Filename expansion






















#   - Brace expansion: $ {1..5} $ becomes $ 1 2 3 4 5 $
#   - $ echo <(echo hello) $ becomes $ echo /dev/fd/63 $ because <(..) starts a background process to execute whatever command is inside, sends the
#     output to a file, and replaces itself with the pathname of the file
#   - Other special operators: |, etc.





#   - Brace expansion
#   - Tilde expansion
#   - Shell parameter expansion
#   - Command substitution
#   - Arithmetic substitution
#   - Process substitution
#   - Word splitting
#   - Filename expansion
#   - Quote removal

# - 3b) Split each command into two parts: the Bash built-in or binary to execute (always the first word in the command) and arguments to that commmand
#   (everything else). This process is called word splitting, and is usualy done with whitespace (e.g. the default IFS value of <newline><tab><space>
#   are set) 

# - 4b) Execute the commands with their arguments
#   - If the command is a shell built-in (i.e. a command that doesn't exist as a binary file on the filesystem, only as part of the shell itself), the
#     command is executed by the same Bash process that has been working up to this point
#     - $ man dirs $ to see all of the built-ins
#   - If the command is a binary on the filesystem, Bash forks a child Bash process and executes the program in the forked process. The parent process
#     waits for the child to return










# https://mywiki.wooledge.org/Arguments - Yes this is actually the introduction and it reads poorly
# https://mywiki.wooledge.org/WordSplitting




# The shell's job is to translate my strings into system calls. Every built-in Bash command is actually a file (e.g. /bin/rm). When a built-in command
# is executed, the path of the file (e.g. /bin/rm) is passed to the execve(2) system call along with 1) an array of arguments and 2) an array of
# environment variables.

# Before the shell every executes any commands, the parser performs the following operations in order:
# 1) brace expansion
# 2) tilde expansion
# 3) parameter, variable, and arithmetic expansion
# 4) command substitution: $()
# 5) word splitting
# 6) pathname expansion