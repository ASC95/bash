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

# - 2b) Perform expansions of various types. See /4-expandsions notes