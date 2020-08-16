#!/usr/bin/env bash

# - https://linuxize.com/post/bash-functions/#return-values

# - The $ return $ keyword exits the function and returns the exit code of the function
#   - By default, $ return $ returns an exit code of 0
# - $ return $ is different from exit in that if it is used within a function, it merely exits the function instead of terminating the entire script
#   - Think of a function as a Bash command and think of $ return $ as the exit code of that Bash command
# - $ return $ can be used outside of a function. In that case, it acts like exit
return_an_exit_code() {
    return 222
    #return
}

# - The easiest way to actually "return" a value from a function is to modify/create a global variable
fake_return_a_value() {
    num=(("$1" + 6))
}

#return_an_exit_code
#echo $? # 222

num=1
fake_return_a_value $num
echo $num