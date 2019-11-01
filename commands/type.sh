# https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-then
# https://www.linuxjournal.com/article/6463 - somewhat comprehensible explanation of compiler, linker, and loader

# $ type --help
# - type can take multiple arguments
# - also see command.sh

# Examples:
# - $ type $ is a builtin, so it resides at /usr/bin/type
#   - There are a lot of cool builtins there that I never knew about before
# - $ ls $ is a file, so it resides at /bin/ls
#   - The files in /bin are actually binary files, which seem like the lowest-level tools available. These binary files cannot be sourced, as Bash
#     cannot execute a binary file, but they can be executed, since execution sends the binary file to the program loader, at which point the file
#     tells the program loader how to execute it.
#   - $ ls $ is actually an alias becaus of my .bash_profile file 
# - $ python $ is a file installed by Homebrew, so it resides at /usr/local/bin/python

find_all_possible_executables() {
    type -a $1
}

get_executable_type() {
    type -at $1
}

# Force a path search for each name, and return the name of the disk file that would be executed
see_which_executable_would_be_executed() {
    type -P $1
}

examine_bin_folder() {

}

#find_all_possible_executables 'python' # python is /usr/local/bin/python, python is /usr/local/bin/python, python is /usr/bin/python
#get_executable_type 'python' # file, file, file
#see_which_executable_would_be_executed 'python ls'

ls=$(command -v ls)