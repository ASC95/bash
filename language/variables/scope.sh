# https://linuxize.com/post/bash-functions/ - variables default to global scope
# https://stackoverflow.com/questions/124167/bash-variable-scope

# In Bash, all variables are global variables, even if they are defined inside of a function
# - the "local" keyword when used inside of a function will create a local variable

other_value=$((other_value + 2))
create_num() {
    value=$((value + 6))
    other_value=$((other_value * 2 + 8))
    local local_var=7 # This variable isn't set outside of this function
    implicit_global=99
}
value=$((value / 2))

create_num
# This is 6 because 0 / 2 + 6 = 6
printf '%s\n' $value # 6
# This is 12 becuae (0 + 2) * 2 + 8 = 12
printf '%s\n' $other_value # 12
# This is 0 because 6 * 0 = 0
value=$((value * local_var)) # local_var isn't defined, so it evaluates to 0 in a math context
printf '%s\n' $value # 0
# implicit_global only was declared within the function, but it is still visible
printf '%s\n' $implicit_global # 99