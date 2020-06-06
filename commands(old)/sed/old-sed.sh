# https://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands - sed in-place substitution
# https://www.mkyong.com/mac/sed-command-hits-undefined-label-error-on-mac-os-x/ - sed on macOS
# https://stackoverflow.com/questions/4247068/sed-command-with-i-option-failing-on-mac-but-works-on-linux - sed on macOS
# https://www.cyberciti.biz/faq/unix-linux-sed-print-only-matching-lines-command/ - print matching lines with sed

# https://www.computerhope.com/unix/used.htm - sed commands

# sed is NOT meant to replace grep! Don't use sed to do grep's job. sed's entire functionality is built on editing its input according to some rules
# and spitting out output. grep does not edit output. It only outputs lines that match some pattern.

# These are bad notes below here...


# Basic syntax (see man page)
# sed [-Ealn] command [file ...]
#
# sed commands
# The form of a sed command is as follows: [address[,address]]function[arguments]
# - addresses are optional
#
# Common sed functions
# - i
#
# Examples:
# 
#

# sed has many commands that tell sed what to do when it does/doesn't find a match in the input
# -

# The 'i\' command writes the text to stdout
just_print_the_line() {
    str1='This is a WARNING'
    str2='This is OK'
    printf '%s' $str1 | sed 'i\'
    printf '%s' $str2 | sed 'i\'
}

# - "-i": save the changes back to the original file
# - s: the substitute command
# - Long story short, on macOS I must create a backup file by specifying an extension to go with the -i flag. I can delete the file afterwards
replace_line() {
    sed -i .sedbkp 's/^I am line 1$/WHOOO!!!/' testfile.txt && rm *.sedbkp
}



# sed reads from stdin or a file, not command-line arguments
detect_substring() {
    str1='This is a WARNING'
    str2='This is OK'
    sed -n '/OK/p' <(printf '%s' $str1)
    sed -n '/OK/p' <(printf '%s' $str2)
    #sed -n '/OK/p' <(printf '%s' $str1)
    #sed -n '/OK/p' <(printf '%s' $str2)
    #sed 'i\'  <(printf '%s' $str2)
    #printf '%s\n' $(sed)
}

#just_print_the_line
#replace_line
detect_substring