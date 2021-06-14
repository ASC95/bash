#!/usr/bin/env bash

# Options (see $ man ls)
# -l: display permissions (it's really displaying "long format")
# -i: display inode number
# -F: include characters afer the filename that make it easier to recognize the file type

# When $ ls $ outputs to a shell, it outputs a single string of tab-delimited values. This can be changed with the -1 flag, which will delimit
# entries with newlines insteads of tabs
# - Since I execute this file with a shell, I can see the difference in output in VSCode
# - When $ ls $ outputs to a file descriptor that is not a shell, the newline delimiters are used by default
one_line_output() {
    #ls
    ls -1
}

list_directory_permissions() {
    ls -ld '/Users/austinchang/pycharm/omf/omf'
}

list_only_directories_in_current_directory() {
    ls -l | grep '^d'
}

list_only_directories_of_filenames(){
    cat '/Users/austinchang/pycharm/omf/files.txt' | xargs ls -l
    #cat '/Users/austinchang/pycharm/omf/files.txt' | xargs ls -l | grep '^d'
}

list_files_in_directory() {
    # Show all files
    #ls "/Users/austinchang/pycharm/omf/omf/models"
    # Show only *.py files
    cd "/Users/austinchang/pycharm/omf/omf/models" && ls *.py
}

#one_line_output
#list_directory_permissions
#list_only_directories_of_filenames
list_files_in_directory