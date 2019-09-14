# https://unix.stackexchange.com/questions/81998/understanding-of-diff-output

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # change to directory of this script

compare_files() {
    diff file1.txt file2.txt
}

# Strings can be compared by echo-ing in a subshell and redirecting the output of the subshell into the diff command
# 1c1           - "c" stands for 
# < hi          - "<" denotes the first file (left-most argument)
# ---
# > hello       - ">" denotes the second file (right-most argument)
compare_strings() {
    diff <(echo -e 'hi \n bye') <(echo -e 'hello \n bye \n sigh')
}

compare_files
#compare_strings