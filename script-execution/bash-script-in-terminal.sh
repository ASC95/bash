#!/bin/bash

# https://www.linuxquestions.org/questions/linux-software-2/bash-script-directly-in-terminal-4175534396/
# https://stackoverflow.com/questions/3005963/how-can-i-have-a-newline-in-a-string-in-sh

# Example 1
# $ /bin/bash -c 'foo=Q; for i in {1.1000}; do for i in {1..1000}; do foo+=Q; done; foo+=$"\n"; done; echo $foo' > input1.txt
