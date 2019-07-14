# https://unix.stackexchange.com/questions/11376/what-does-double-dash-mean-also-known-as-bare-double-dash

# If a file starts with a dash, Bash will interpret the filename as an option, which is wrong! Unambiguously mark the end of options to a built-in
# command with $ -- $
mark_end_of_options() {
    cur_dir=$(dirname "${BASH_SOURCE[0]}")
    # Does not work. This directory has a space in it, and $<var> performs word splitting!
    #cd $cur_dir
    # Works. "$<var>" makes Bash NOT do word splitting
    cd "$cur_dir"
    # Does not work
    #cat "-weird-name.txt"
    # Works
    cat -- "-weird-name.txt"
}

# It seems that double dash options must go before single dash options, at least for grep
#option_ordering() { }

mark_end_of_options