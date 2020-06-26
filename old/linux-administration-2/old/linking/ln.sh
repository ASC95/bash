#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# Don't use the -F or -f options to overwrite stuff. If there's a conflict, examine the files in question and carefully delete before linking
#    - f WILL wipe out the original contents of a file

# - Command: $ ln <original file> <new directory>
# - Options:
# - Notes:
#   - Don't do this
#   - If <new directory> is a nonexistent directory, then ln interprets <new directory> as a filename and creates a hard/soft link to the new file
#   - If <new directory> is an existing directory, then ln creates a hard/soft link to <original file> within <new directory>
link_file_to_directory() {
    ln ./some-dir/realfile.txt another-dir
}

# - Command: $ ln -s <original directory> <new file>
# - Options:
#   - s: create a soft (symbolic) link instead of a hard link
# - Notes:
#   - Don't do this
#   - The description is misleading: <original directory> can only ever be used to create another directory
#   - ln does not let me perform this command at all without the -s option
#   - If <new file> is a nonexistent file, then ln creates a symbolic directory named <new file>
#   - If <new file> is an existing file, then ln complains that the file already exists and does not create the symbolic directory
link_directory_to_file() {
    ln -s another-dir unique-file.txt
}

# - Command: $ ln -s <original directory> <new directory>
# - Options:
#   - s: create a soft (symbolic) link instead of a hard link
# - Notes:
#   - ln does not let me perform this command at all without the -s option
#   - If <new directory> is a nonexistent directory, then ln creates a symbolic link, called <new directory> to <original directory>, as expected
#   - If <new directory> is an existing directory, then ln creates a symbolic link to <original directory> within <new directory>
link_directory_to_directory() {
    ln -s another-dir some-dir
}

# - Command: $ ln <original file> <new file>
# - Options:
# - Notes:
#   - If <new file> is a nonexistent file, then ln creates the hard or soft link to <original file> as expected
#   - If <new file> is an existing file, then ln complains that the file already exists and does not create the link
link_file_to_file() {
    ln some-dir/realfile.txt this-is-a-link 
}