# https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02
# https://unix.stackexchange.com/questions/4899/var-vs-var-and-to-quote-or-not-to-quote - $var vs. ${var}

# Parameter expansion (i.e. the ${<expression>} sytax) substitutes the value of the <expression> in place of ${<expression>}
basic_parameter_expansion() {
    var="cats"
    echo I like $var # I like cats
}

# a=$b is equivalent to a=${b}, except for a few cases:
# - braces are required to dereference array elements
shorthand_vs_regular_parameter_expansion() {
    my_array=(item1 item2 item3)
    echo ${my_array[0]} # item1
    echo ${my_array[1]} # item2
    echo ${my_array[2]} # item3
    # Wrong!
    echo $my_array[0] # item1[0]
}

# Putting quotes around a variable isn't necessary, but it is a good idea so I should always do it. It ensures that Bash interprets the contents of
# the variable as an atomic unit.
# Technically, field splitting and pathname expansion are disabled during variable assignment, so quotes shouldn't ever be necessary when assigning
# one variable to the value of another variable. It's good to stay in the habbit of using quotes, so I should still do it.
no_quotes_vs_quotes() {
    var="A nice filename.txt"
    #touch $var # Will create a file named "A"
    #touch "$var" # Will create a file named "A nice filename.txt"
    var2=$var # field splitting and pathname expansion are disabled during variable assignment
    echo $var2 # A nice filename.txt
}

basic_parameter_expansion
#shorthand_vs_regular_parameter_expansion
#no_quotes_vs_quotes