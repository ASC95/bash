# https://tiswww.case.edu/php/chet/bash/bashref.html#Filename-Expansion 
# https://mywiki.wooledge.org/glob - glob details
# https://docstore.mik.ua/orelly/linux/run/ch04_08.htm - easy introduction to globbing
# https://www.linuxjournal.com/content/globbing-and-regex-so-similar-so-different - regex vs globbing syntax

# Filename expansion is done with globbing, not regular expressions. Globbing is less powerful than regular expressions, but easy to use.

cd "$( dirname "${BASH_SOURCE[0]}")"

# In addition to wildcard, ?, and bracket globbing, Bash can use extended globs. See the notes because there are actually lots of patterns for
# globbing!

# Globbing is NOT applied to strings that are in quotes! THIS IS IMPORTANT
failed_globbing() {
    ls 3-* # All files in the cwd
    ls '3-*' # No globbing applied to single quotes
    ls "3-*" # No globbing applied to double quotes
    ls $'3-*' # No globbing applied to ANSI-C quotes
}

# Globbing explicitly works ONLY on filenames in Bash, regardless of the command. Globbing with paths works just fine, just be sure that I'm using a
# valid path!
wildcard_globbing() {
    ls 3-*-expansion.sh # lists all filenames in the cwd
    printf '%s\n' 3-*-expansion.sh # lists all of the filenames in the cwd
    printf '%s\n' ~/tutorials/bash/language/parser/3-expansions/3-*-expansion.sh # lists all of the filenames in that directory
}

# Bracket globbing is very similar to character classes in regex
# - [<char1><char2>] matches char1 or char2, not a range
# - 
bracket_globbing() {
    # 3-4-arithmetic-expansion.sh is the only filename with a "c" before a "-"
    ls 3-*[c]-* # 3-4-arithmetic-expansion.sh
    # Doesn't print 'arithmetic' because it doesn't end with d or e
    # - 3-1-brace-expansion.sh, 3-3-variable-expansion.sh, 3-7-word-splitting.sh
    # - 3-2-tilde-expansion.sh, 3-5-command-substitution.sh, 3-8-filename-expansion.sh
    ls 3-*[de]-*
    # a, b, and f are in the range of [a-f], so only those filenames are printed
    ls 3-?-[a-f]* # 3-1-brace-expansion.sh, 3-4-arithmetic-expansion.sh, 3-5-command-substitution.sh, 3-8-filename-expansion.sh
}

#failed_globbing
#wildcard_globbing
bracket_globbing