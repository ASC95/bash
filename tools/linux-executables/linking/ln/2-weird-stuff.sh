#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - If I accidentally use an existing directory as the target, the symbolic link will be created inside of target directory. The symbolic link will
#   also have the same name as the target!
#   - This is true regardless of whether the source is a file or directory
accidentally_create_symbolic_link_with_existing_directory_as_target() {
    #source=$(cd ../../.. && pwd)
    source="$(cd ../../../.. && pwd)/.gitignore"
    target="$(cd .. && pwd)/ln"
    printf '%s\n' "$source" "$target"
    #ln -s "$source" "$target"
}

# - If I accidentally use an existing file as the target, the command will fail with an error
#   - This is true regardless of whether the source is a file or directory, as long as I don't use the override flag -f
accidentally_create_symbolic_link_with_existing_file_as_target() {
    source=$(cd ../../.. && pwd)
    #source="$(cd ../../../.. && pwd)/.gitignore"
    target="$(pwd)/2-weird-stuff.sh"
    #printf '%s\n' "$source" "$target"
    ln -s "$source" "$target"
}

accidentally_link_twice_at_same_target_directory() {
    # - The first time I run these commands, a directory symlink is created within linking/, as desired
    # - The SECOND time I run these commands (with the first symlink still around), a directory symlink to the correct source is created within the
    #   source itself!
    #   - THIS is what was causing those extremely annoying symlinks to appear within Splunk app directories!
    #   - Bash is simply doing the same thing as the first example. It finds that the target is an existing directory, so it goes inside of it and
    #     places the symlink!
    source="$(cd ../../../.. && pwd)"
    target="$(cd .. && pwd)/my-bash-symlink"
    #printf '%s\n' "$source" "$target"
    ln -s "$source" "$target"
}

#accidentally_create_symbolic_link_with_existing_directory_as_target
#accidentally_create_symbolic_link_with_existing_file_as_target
accidentally_link_twice_at_same_target_directory