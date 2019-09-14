# https://unix.stackexchange.com/questions/4899/var-vs-var-and-to-quote-or-not-to-quote

# - TLDR: The best way to do variable expansion is: "${variable}"
# - $VAR is almost equivalent to ${VAR}. The difference is that the first version cannot 1) reference an array or 2) remove a substring

# If a variable contains spaces, it should be expanded with quotes so that the entire variable is atomic
# - Word-splitting actually is governed by the special $IFS shell variable, which by default is <space><tab><newline>. This can be changed
expand_variable_that_contains_spaces() {
    var="I'm a cool var"
    printf ${var} # I'm
    printf "\n${var}" # I'm a cool var
}

expand_variable_that_contains_spaces