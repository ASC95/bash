#!/bin/bash

# https://www.hostingadvice.com/how-to/set-command-aliases-linuxubuntudebian/
# https://unix.stackexchange.com/questions/148545/why-does-sudo-ignore-aliases

# Aliases are case-sensitive
# VERY IMPORTANT: sudo ignores aliases!!!!!

declare_alias() {
    alias myCoolAlias="echo alias activated"
}

remove_alias() {
    unalias myCoolAlias
}

remove_all_aliases() {
    unalias -a
}

#declare_alias
remove_alias