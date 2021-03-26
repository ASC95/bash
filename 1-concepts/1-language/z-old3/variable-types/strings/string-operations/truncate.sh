#!/usr/bin/env bash

# - https://tldp.org/LDP/abs/html/string-manipulation.html

remove_trailing_substring() {
    str='pogo sticksss' 
    # - Remove longest trailing substring with %%
    printf '%s\n' "${str%%s*}"
    # - Remove shortest trailing substring with %
    printf '%s\n' "${str%s*}"
}

remove_trailing_substring
