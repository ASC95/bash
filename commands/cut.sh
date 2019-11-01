# https://www.computerhope.com/unix/ucut.htm

# - $ cut $ writes to stdout by default
# - $ cut $ always expects a file, but that can be handled with process substitution
# - If cutting by a specified range, the indexes are [inclusive, inclusive]. Also, indexes start at 1!

cut_positional_argument() {
    #printf '%s\n' $(cut -c 1-3 <(printf '%s' 'books are nice')) # boo
    printf '%s\n' $(cut -c 1-3 <(printf '%s' $1)) # wha
}

# This example isn't strictly necessary, because the '*' characters that appear in the output of $ ls $ are added by the shell. They aren't part of
# the actual filenames
cut_last_character() {
    # See xargs
}

#cut_positional_argument 'whatever'