#!/usr/bin/env bash

# - https://linuxhint.com/bash_declare_command/
# - https://www.linuxjournal.com/content/bash-brace-expansion

cd "$(dirname "${BASH_SOURCE[0]}")"

# - Brace expansion is not a command by itself. It must be used with another command

# - All this example does is write the string 'echo ${bar}' into the 'echo-bar.sh' file
expand_to_echo_trickery() {
    # Write the string 'one two three' to stdout and redirect stdout into 'echo-bar.sh'
    echo one two three > 'echo-bar.sh' 
    # Write the string 'echo ${bar}' to stdout and redirect stdout into 'echo-bar.sh'
    echo 'echo ${bar}' > 'echo-bar.sh' 
    # This is an arcane and dumb way to accomplish the same task, but it's kind of cool
    # echo{,} evaluates to echo echo
    echo{,} \${bar} > 'echo-bar.sh'
}

# - Comma-separated lists cannot have ANY whitespace between the elements
expand_comma_separated_list() {
    # This is wrong
    echo 'first'{'born', 'blood', 'hand'} # first{born, blood, hand}
    # This is right
    echo 'first'{'born','blood','hand'} # firstborn firstblood firsthand
}

# - Brace expansions can be combined. Comma-separated lists are no exception
combined_comma_separated_lists() {
    echo {'first','second'}{'born','blood','hand'} # firstborn firstblood firsthand secondborn secondblood secondhand
}

# - Sequences can be nested within comma-separated lists
nested_sequence() {
    echo {'a','b'{1..3},'c'} # a b1 b2 b3 c
}

#expand_to_echo_trickery
#expand_comma_separated_list
#combined_comma_separated_lists
nested_sequence
