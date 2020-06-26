# https://unix.stackexchange.com/questions/17107/process-substitution-and-pipe
# https://tiswww.case.edu/php/chet/bash/bashref.html#Command-Grouping

# Any redirections (see Redirections) associated with a compound command apply to all commands within that compound command unless explicitly
# overridden. Compound commands include:
# - looping
# - conditionals
# - command grouping
#   - Hence, a redirection (e.g < or >) applies to all commands within a command grouping, unless explicitly overridden
#       - (....) - executes the commands in a subprocess
#       - {...;} - executes the commands in the current shell context