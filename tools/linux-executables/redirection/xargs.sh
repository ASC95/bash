#!/usr/bin/env bash

# - https://stackoverflow.com/questions/6129633/how-can-i-use-0-option-to-xargs-when-specifying-the-input-manually - how the -0 xargs option works
# - https://unix.stackexchange.com/questions/89130/format-output-of-xargs - format xargs output
# - https://stackoverflow.com/questions/5456120/how-to-only-get-file-name-with-linux-find - format $ find $ output

cd "$(dirname "${BASH_SOURCE[0]}")"

# - xargs has a wonderful -p flag that runs it in interactive mode. I can use this flag to literally see how xargs is providing arguments to the next
#   command
visualize_arguments() {
    cd ~
    # - The filenames are incorrectly printed in this example. I fix this in the next example
    # - Output: printf '~%s~ ' Android AndroidStudioProjects Desktop Documents Downloads keymaptable Music Pictures programming Public scratch.txt
    #   snap Templates Videos VirtualBox VMs 
    printf '%s\n' * | xargs -p printf '~%s~ ' 
    # - Output: ~Android~ ~AndroidStudioProjects~ ~Desktop~ ~Documents~ ~Downloads~ ~keymaptable~ ~Music~ ~Pictures~ ~programming~ ~Public~
    #   ~scratch.txt~ ~snap~ ~Templates~ ~Videos~ ~VirtualBox~ ~VMs~
}

# - When the -0 option is passed to xargs, it makes xargs EXPECT that the input items are delineated by the null character (i.e. \0)
#   - One way in which to GET input in this format is to use $ find $ with the -print0 flag
# - This example prints 'Virtualbox VMs' as a single string, as it should be
expect_null_character_separator() {
    cd ~
    # - $ find $ arguments:
    #   - $ -maxdepth 1
    #       - Make $ find $ behave like $ ls $ and only search the current directory. I NEVER want to send the output of ls to another command
    #   - $ -not 
    #       - Invert the match. This is great for ignoring hidden files
    #   - $ exec <command> ;
    #       - $ exec basename {} ;
    #           - The "{}" brackets are a SPECIAL string ONLY for the -exec flag that is replaced by the filename for each invocation of <command>
    #           - The semicolon must be escaped via \; or ';' because the -exec flag NEEDS a LITERAL ; character to understand where <command>
    #             terminates. If the semicolon weren't escaped, it would function as a normal Bash semicolon and terminate the entire line
    # - It is unfortunate that I can't use $ -print0 $ and $ -exec basename {} ; $ together because the filename are printed twice!
    #find . -maxdepth 1 -not -name ".*" -print0 -exec basename {} \; | xargs -0 printf '~%s~\n'

    # - This works, but the path component of each filename is kept which is ugly. See invoke_command_for_each_argument() for how to fix this
    find . -maxdepth 1 -not -name ".*" -print0 | xargs -0 printf '%s\n'
}

# - By default, xargs delimits its each output element with a single space
#   - There is no nice built-in way to format xargs output. See the source for a dozen different ways of using other tools, like sed, to do it
visualize_xargs_output_delimiter() {
    cd ~
    find . -maxdepth 1 -not -name ".*" -print0 | xargs -p -0 printf '%s\n'
}

# - Normally, xargs provides the function with ALL of the arguments at once, with each argument delineated by a single space. To invoke the command
#   separately for each argument use the $ -n 1 $ flag and value
invoke_command_for_each_argument() {
    cd ~
    # - $ basename $ strips the entire directory path portion from the specified filename, but leaves the file extension
    #   - The filename extension can also be removed, but it's optional
    #find . -maxdepth 1 -not -name ".*" -print0 | xargs -p -n 1 -0 basename
    find . -maxdepth 1 -not -name ".*" -print0 | xargs -n 1 -0 basename
}

#visualize_arguments
expect_null_character_separator
#visualize_xargs_output_delimiter
#invoke_command_for_each_argument
