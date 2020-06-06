#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# https://unix.stackexchange.com/questions/281938/grep-word-boundaries

# The literals patterns "\<" and "\>" match the beginning and end of a word, respectively
# - Recall that a "word" consists of only alphanumeric characters and the underscore
# - More precisely, "\<" and "\>" match the empty string at the beginning and end of a word
word_boundaries() {
    grep -ni "\<pid.txt\>" '/Users/austinchang/pycharm/omf/omf/models/__neoMetaModel__.py'
}

# Even with parentheses that are intended to denote groups to OR, as opposed to ORing the entire regular expression, grep still ORs the entire
# expression. The solution is piping (annoying)
or() {
    # Should not output "Apples are not delicious", but it does
    #egrep -ni "(apples)|(bananas) are delicious" './test.txt' 
    # Good
    #grep -Eni -e "apples|bananas" './test.txt' | fgrep -i "not" # 1:Apples are not delicious
    grep -Eni -e "apples|bananas" './test.txt' | fgrep -iv "not" # 3:Bananas are delicious
}

# (<group>)\? marks an optional group.
# - Remember that a parethesis is a literal character in grep, but not egrep
#optionals() {
#    egrep -ni "Apples|Bananas are delicious" './test.txt'
#}

#word_boundaries
or