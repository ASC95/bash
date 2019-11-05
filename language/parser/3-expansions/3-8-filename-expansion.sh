# https://tiswww.case.edu/php/chet/bash/bashref.html#Filename-Expansion 
# https://mywiki.wooledge.org/glob - glob details
# https://docstore.mik.ua/orelly/linux/run/ch04_08.htm - easy introduction to globbing
# https://www.linuxjournal.com/content/globbing-and-regex-so-similar-so-different - regex vs globbing syntax

# Filename expansion is done with globbing, not regular expressions. Globbing is less powerful than regular expressions, but easy to use.

cd $( dirname ${BASH_SOURCE[0]} )

# In addition to wildcard, ?, and bracket globbing, Bash can use extended globs. See the notes because there are actually lots of patterns for
# globbing!

# Globbing is NOT applied to strings that are in quotes! THIS IS IMPORTANT
failed_globbing() {
    ls 4-* # All files in the cwd
    ls '4-*' # No globbing applied to single quotes
    ls "4-*" # No globbing applied to double quotes
    ls $'4-*' # No globbing applied to ANSI-C quotes
}

# Globbing explicitly works ONLY on filenames in Bash, regardless of the command. Globbing with paths works just fine, just be sure that I'm using a
# valid path!
wildcard_globbing() {
    ls 4-*-expansion.sh # lists all filenames in the cwd
    printf '%s\n' 4-*-expansion.sh # lists all of the filenames in the cwd
    printf '%s\n' ~/tutorials/bash/language/parser/4-expansions/4-*-expansion.sh # lists all of the filenames in that directory
}

# Bracket globbing is very similar to character classes in regex
# - [<char1><char2>] matches char1 or char2, not a range
# - 
bracket_globbing() {
    #ls 4-*[c]-* # 4-4-arithmetic-expansion.sh
    # Doesn't print 'arithmetic' because it doesn't end with d or e
    #ls 4-*[de]-* # 4-1-brace-expansion.sh 4-2-tilde-expansion.sh 4-3-variable-expansion.sh 4-7-filename-expansion.sh
    # a, b, and f are in the range of [a-f], so only those filenames are printed
    ls 4-?-[a-f]* # 4-1-brace-expansion.sh 4-4-arithmetic-expansion.sh 4-7-filename-expansion.sh
}

failed_globbing
#wildcard_globbing
#bracket_globbing