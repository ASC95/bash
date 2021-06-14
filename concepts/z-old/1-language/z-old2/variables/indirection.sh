#!/usr/bin/env bash

# - https://riptutorial.com/bash/example/7567/parameter-indirection

# - Indirection works by
#   - 1) Expanding ${!<var1>} into the VALUE of <var1>
#       - E.g. ${!color} becomes ${red}
#   - 2) Referencing the expanded value AS a variable name
#       - E.g. ${red} expands to "the color red"
# - Indirection isn't very useful. Use $ declare -n $ instead
use_indirection() {
    red="the color red"
    green="the color green"
    color=red
    echo "${!color}" # the color red
    color=green
    echo "${!color}" # the color green
}

use_indirection