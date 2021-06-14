#/usr/bin/env bash

# https://mywiki.wooledge.org/BashGuide/TestsAndConditionals - lots of good examples
# https://ss64.com/bash/test.html - easier to read

# The test command returns 0 if the expression evaluated successfully, otherwise it returns with a nonzero exit code
# - '[' is a shell built-in command
# - The test command (aka [) doesn't NEED an 'if' statement, but they work together well

string_equality() {
    #if [a = b]; then # bad, [ must have whitespace around it
    if [ a = b ]; then
        echo 'true!'
    else
        echo 'false!' # false!
    fi
}

# The test built-in follows the normal Bash parser process for execution
variable_expansion() {
    first='Austin'
    last='Austin'
    if [ "My name is $first" = "My name is $last" ]; then
        echo 'true!' # true
    else
        echo 'false!'
    fi
}

#string_equality
variable_expansion