#!/usr/bin/env

# - https://mywiki.wooledge.org/BashGuide/TestsAndConditionals - string equality checking AND pattern matching

# - TLDR; string equality comparision is easy, but ALWAYS double quote the right-hand variable or string literal!
# - These notes are ONLY about the new test context. They have nothing to do with an arithmetic context. These operators can have different meanings
#   in arithmetic contexts

# - String equality assertion is easy. Just use the = operator
#   - The == operator is an alias for the = operator
assert_strings_are_equal() {
    if [[ 'foobar' = 'foobar' ]]; then
        echo 'strings are equal'
    else
        echo 'strings are not equal'
    fi
}

# - The = operators (and therfore the == operator) perform pattern matching whenever the right-hand side of the comparision is NOT quoted (see the next
#   section)
#   - I mention that here because if the right-hand side is merely a string literal, then it's as if simple equality checking were being done
#       - However, if the right-hand side accidentally contains an unquoted glob pattern, then pattern matching is performed!
# - To avoid confusion, always double quote both sides when doing equality comparision
be_careful_with_pattern_matching() {
    # - Let's pretend that somehow this variable ended up as the literal value "foo*"
    var='foo*'
    # - Bash does pattern matching here even though I didn't want it to!
    #if [[ 'foobar' = $var ]]; then
    # - This ENSURES that Bash is doing simple equality comparision!
    #if [[ 'foobar' = "$var" ]]; then
    # - This also ensures that Bash is doing simple equality comparision
    if [[ 'foobar' = 'foo*' ]]; then
        echo 'strings are equal'
    else
        echo 'strings are not equal'
    fi
}

#assert_strings_are_equal
be_careful_with_pattern_matching
