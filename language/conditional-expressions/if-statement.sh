# https://mywiki.wooledge.org/BashGuide/TestsAndConditionals

cd $( dirname ${BASH_SOURCE[0]} )
# The if-statement executes some commands and branches to 'then' if the exit code of the commands was 0, otherwise it branches to 'else'
# - There must always be a 'then' statement with some commands to run. There cannot just be an 'else' statement
examine_if_flow() {
    if true; then # The built-in 'true' always returns with an exit code of 0, so 'if' will always branch to 'then'
        printf '%s\n' 'It was true'
    fi
    # Here is the horrible one-line syntax. In general, separate commands must be separated by newlines or semicolons
    if false; then printf '%s\n' 'Never executes'; else printf '%s\n' 'It was false'; fi
    false; printf '%s\n' "The built-in false command's exit code was $?" # 1
}

# The 'if' keyword is frequently used with [ (aka test), but it can be used with any command(s)
# - These two commands do the same thing
if_works_with_any_command() {
    if rm "blah.txt" 2>/dev/null; then echo 'Removal successful!'; else echo 'Removal failed!'; fi # Removal failed!
    rm "blah.txt" 2>/dev/null && echo 'Removal successful!' || echo 'Removal failed!' # Removal failed!
}

# if-statements can have multiple branches as needed
lots_of_branches() {
    if false; then
        echo 'never executes'
    elif true; then
        echo 'hello!' # hello1
    else
        echo 'goodbye'
    fi
}

#examine_if_flow
#if_works_with_any_command
lots_of_branches