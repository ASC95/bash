#!/usr/bin/env bash

# - Important considerations (I should reference other notes where I explore these issues more)
#   - GNU grep searches stdin if no filename is provided. I have GNU grep!

# - odt2txt is a third-party utility that extracts text from odt documents
#   - It only accepts a single filename as an argument
# - See /home/austin/programming/tutorials/bash/3-tools/linux-executables/redirection/xargs.sh
# - See /home/austin/programming/tutorials/bash/3-tools/linux-executables/file-search/find.sh
grep_odt_files() {
    mapfile -d '' odt_files < <(find "$1" -name "*.odt" -print0)
    #declare -p odt_files
    for fpath in "${odt_files[@]}"; do
        if grep -C 3 -i "$2" <(odt2txt "$fpath"); then
            printf '\n\t^^^\n\t%s\n\n' "Found in file: $fpath"
        fi
    done
}

# - Cut and paste this in the top-level directory that I want to search, then substitute <pattern>
# - It really works! I can search my odt files!
#   - However, I cannot see WHICH file the text came from
grep_odt_files_one_liner() {
    find . -iname "*.odt" -print0 | xargs -0 -n 1 odt2txt | grep -i "<pattern>"
}

#grep_odt_files '/media/austin/3C4AC9214AC8D932/Users/Austin/Sync/programming/' 'hmac'
#grep_odt_files '/media/austin/3C4AC9214AC8D932/Users/Austin/Sync/nreca/' 'parser'
grep_odt_files '/media/austin/3C4AC9214AC8D932/Users/Austin/Sync/finance' 'red herring'
#grep_odt_files '/media/austin/3C4AC9214AC8D932/Users/Austin/Sync/nreca' 'python 3'
#grep_odt_files '/media/austin/3C4AC9214AC8D932/Users/Austin/Sync/programming' 'key map'
