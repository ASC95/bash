#!/usr/bin/env bash

# - https://stackoverflow.com/questions/11180714/how-to-iterate-over-an-array-using-indirect-reference

# - This doesn't work: "${!<variable that contains same name as array>[<array key>]}"
#   - I'm trying to expand the variable into the string that is the name of the array, then I'm trying to indirectly reference the array through the
#     string
# - However, I CAN use declare -n