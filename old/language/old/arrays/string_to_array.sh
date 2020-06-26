# https://stackoverflow.com/questions/10586153/split-string-into-an-array-in-bash 
# https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash#tab-top

# Reading a string with elements that are delineated by spaces into an array is easy
# - <command> <<< <string> is a "here string". It passes <string> into <command> on the left via stdin
read_space_delineated_string_into_array() {
    string="foo bar    baz"
    read -a array <<< "$string"
    for e in "${array[@]}"
    do
        printf '%s\n' $e
    done
    printf '%s!\n' "${array[@]}"
}

# Reading a string with elements that are delineated by newlines is much harder (still haven't done it)
# - Newline is the default value of the IFS
# - "read" doesn't like capturing newlines by default. In fact, "read" stops when it finds the first newline
read_newline_delineated_string_into_array() {
    string=$'foo\nbar\nbaz'
    #printf '%s' $string # foobarbaz
    #printf '%s' "$string" # foo\nbar\nbaz

    IFS=$'\n' read -a array <<< "$string"
    for e in "${array[@]}"
    do
        printf '%s\n' $e
    done

    #printf '%s!\n' "${array[@]}"
}

#read_space_delineated_string_into_array
read_newline_delineated_string_into_array