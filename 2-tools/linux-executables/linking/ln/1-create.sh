#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - I could create hard links, but why would I ever want to? Just always use the -s flag

# - ln -s <source> <target>
#   - <source> is the file I want to create a link to
#   - <target> is where the symbolic link will be located and what it will be called
# - Troubleshooting:
#   - The <source> never resolves to the cwd. <source> must always be an absolute path
create_symbolic_link_from_file_to_file() {
    # - This is bad because "bash.code-workspace" isn't an absolute path
    #cd ../../../..
    #ln -s bash.code-workspace "$target"
    # - This is the correct approach
    source="$(cd ../../../.. && pwd)/bash.code-workspace"
    target="$(pwd)/workspace-symlink"
    ln -s "$source" "$target"
}

# - Troubleshooting:
#   - The <target> must never end with a trailing slash
create_symbolic_link_from_directory_to_directory() {
    # - This is bad because the <target> ends with a trailing slash
    #source="$(cd ../../../.. && pwd)"
    #target="$(pwd)/bash-dir-symlink/"
    #ln -s "$source" "$target"
    # - This is good
    source="$(cd ../../../.. && pwd)"
    target="$(pwd)/bash-dir-symlink"
    ln -s "$source" "$target"
}

# - Tilde expansion is handled by the parser, not $ ln $, so of course it works fine
tilde_expansion_works_fine() {
    target="$(pwd)/programming-symlink"
    ln -s ~/programming "$target"
}

#create_symbolic_link_from_file_to_file
create_symbolic_link_from_directory_to_directory
#tilde_expansion_works_fine
