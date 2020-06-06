# https://unix.stackexchange.com/questions/81998/understanding-of-diff-output
# https://stackoverflow.com/questions/8074998/how-to-control-the-number-of-lines-that-surround-each-difference-when-running-g

cd "$( dirname "${BASH_SOURCE[0]}" )"

# Think of reading the diff output as a set of instructions for how to transform the left file into the right file. The instructions are expressed as
# simply as possible. That means a 'd' or a 'c' could both be used to describe the same operation, but whichever one is less verbose will be chosen.
#
# - 'd' stands for deletion, 'a' stands for adding, and 'c' stands for changing
#   - '3d2' means that the 3rd line in the left file was deleted, and that starting from the 2nd line onwards the files are the same
#   - '5a5' means that we started from the 5th line the in the left file, added a new line, and this new line is equal to the 5th line in the right
#     file
# - '< ...' indicates content in the left file
# - '> ...' indicates content in the right file

# diff file3.txt file4.txt
#
# 1c1        changed 1st line in file3.txt to 1st line in file4.txt. The differences are shown with '<', '---', and '>'
# < hi
# ---
# > hello
# 2a3,4      after the 2nd line in file3.txt, added lines 3 through 4 in file4.txt. The added lines are shown after each '>'
# > 
# > sigh

# diff file1.txt file2.txt
#
# 1,3c1,2                changed lines 1 through 3 to lines 1 through 2
# < This is line 1
# < This is line 2
# < This is line 3
# ---
# > Hey!
# > This is line 100
# 5,6c4,6                changed lines 5 through 6 to lines 4 through 6
# < Nice line
# < Very good
# ---
# > Nice line!
# > Nope
# > 
# 9,10d8                 deleted lines 9 through 10, then set the pointer to line 8
# < yes
# < no
compare_files() {
    diff file1.txt file2.txt
    #diff file3.txt file4.txt
}

# Strings can be compared by echo-ing in a subshell and redirecting the output of the subshell into the diff command:
#
# 1,2c1,3
# < hi 
# < bye
# ---
# > hello 
# > bye 
# > sigh
compare_strings() {
    #diff <(echo -e 'hi \nbye') <(echo -e 'hello \nbye \nsigh') # This gives a different output from the line below because '\nbye' is NOT the same as '\nbye '
    diff <(echo -e 'hi \nbye') <(echo -e 'hello \nbye\nsigh')
}

# Use the -y option to output both files in two columns. Very detailed but often is too much information
extremely_detailed_view() {
    diff -y file1.txt file2.txt
}

adjust_output_window() {
    ## Don't add any extra lines, but give more detailed output
    #diff -U 0 /Users/austinchang/pycharm/omf/omf/scratch/GRIP/helper/olin-barre-dirty.omd /Users/austinchang/pycharm/omf/omf/scratch/GRIP/helper/olin-barre-clean.omd
    ## Add two extra lines of context before AND after a diff section
    diff -U 10 /Users/austinchang/pycharm/omf/omf/scratch/GRIP/helper/olin-barre-dirty.omd /Users/austinchang/pycharm/omf/omf/scratch/GRIP/helper/olin-barre-clean.omd
}

#compare_files
#compare_strings
#extremely_detailed_view
adjust_output_window