#!/usr/bin/env bash

# https://tiswww.case.edu/php/chet/bash/bashref.html#Arithmetic-Expansion
# https://mywiki.wooledge.org/ArithmeticExpression
# https://unix.stackexchange.com/questions/278529/is-a-string-an-arithmetic-expression - what I think is a string is actually a variable name

# Bash only performs integer arithmetic, not floating point arithmetic. If I need floating point arithmetic, I need to use an external program (e.g.
# awk)

# $((..)) performs an arithemtic expansion. What does that mean? It means that 1) the inside of the expansion is a math context and 2) the result of
# the expansion can be assigned to a variable or used elsewhere
arithmetic_expansion() {
    j=5
    sum=$((j + 3))
    printf '%s\n' $sum # 8
    # This is a syntax error because ((..)) is NOT an arithmetic expansion. It is an arithmetic command. It returns a return status code, but that
    # status code cannot be assigned to a variable
    #sum=((j + 10))
    # This is not a syntax error. The command executes. That's all.
    ((sum = sum + 10))
    printf '%s\n' $sum # 18
}

# ((..)) performs an arithmetic command. The return code of the command can be used for different purposes, such as with an if-statement
arithmetic_command() {
    if ((4 < 5))
    then
        echo '4 is less than 5'
    else
        echo '4 is greater than 5'
    fi
}

# Within a math context, variables do NOT need the '$' character to be accessed. In fact, any string that isn't quoted is explicitly evaluated as a
# variable
# - This is confusing because an unset or null variable evaluates to 0 within a math context
variables_inside_arithmetic_context() {
    # ThisIsAString is an unset variable, and so evaluates to 0. The math context interprets the value of 0 to be false, and so returns with an exit
    # code of 1
    (( ThisIsAString )); echo "$?" # 1
    # Same as above
    (( $ThisIsAString )); echo "$?" # 1
    # This is a syntax error because 'Nice' and 'words' are both unset variables that evaluate to 0. '(( 0 0 ))' is a syntax error
    #(( Nice words )) 
    # 0 + 0 is 0, and 0 evalutes to false in a math context
    (( Nice + words)); echo "$?" # 1
}

# Variable assignment must count as a "foreground pipeline" as evidenced by the fact that "$?" evaluates to 0 and 1 even though the only
# difference between the lines is the variable assignment.
evaluate_non_arithmetic_expression() {
    #result=$(( 0 )); echo "$?" # 0
    #(( 0 )); echo "$?" # 1
    ## $result is simply the evaluation of the math context, which was 0
    #echo $result # 0
    $(( 'yay' ))
}

# In Bash, an exit code of 0 indicates successful command execution. That's why the 'true' built-in always returns with an exit code of 0. Anything
# other than a 0 exit code indicates there was a problem. Arithmetic contexts created with 'let' or '((..))' follow an opposite convention according
# to C arithmetic. In C arithmetic, 0 indictes false while any other value indicates true!
examine_exit_code() {
    # This is true because extended test sees that 'true' returned with an exit code of 0, so extended test also returns with an exit code of 0. The
    # if-statement sees this an so branches to the 'then' statement
    if [[ true ]]; then echo 'true!'; else echo 'false!'; fi  # true!
    # This is false because the math context sees that 'true' returned with an exit code of 0, and so the result of the evaluation was false.
    # Since it was false, the math context returns with a nonzero exit code, so the if-statement branches to the else statement.
    if (( true )); then echo 'true!'; else echo 'false!'; fi # false!
    true; echo "$?" # 0
    (( true )); echo "$?" # 1
    false; echo "$?" # 1
    (( false )); echo "$?" # 1
}

#arithmetic_expansion
arithmetic_command
#variables_inside_arithmetic_context
#evaluate_non_arithmetic_expression
#examine_exit_code