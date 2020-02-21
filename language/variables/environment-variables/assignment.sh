#!/usr/bin/env bash

# https://stackoverflow.com/questions/7128542/how-to-set-an-environment-variable-only-for-the-duration-of-the-script
# https://stackoverflow.com/questions/40050793/how-to-print-echo-environment-variables/40050822
# https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai

# Note: sudo doesn't pass environment variables through in most cases, so 
# - "sudo DEBIAN_FRONTEND=noninteractive sudo apt-get install -y tzdata" works but 
# - "DEBIAN_FRONTEND=noninteractive sudo apt-get install -y tzdata" doesn't. 

# $ FOO=soup . assignment.sh # The env variable FOO was: soup
# $ FOO=soup ./assignment.sh # The env variable FOO was: soup
single_line_correct_assignment() {
    printf '%s\n' "The env variable FOO was: $(printenv FOO)"
}

single_line_incorrect_assignment() {
    # Nothing is printed because foo was never an enivronment variable
    foo=bar; printenv foo
    # "bar" is printed because foo was a regular variable, but again, there was never a foo environment variable
    foo=bar; printf '%s\n' "$foo" && printenv foo
    # Nothing is printed because 1) foo was never an environment variable 2) printenv exits with 1 (error) when it tries to print out a nonexistent
    # environment variable 3) The && logical operator only moves onto a successive expression if the previous expression executed successfully, so
    # printf never gets executed
    foo=bar; printenv foo && printf '%s' "$foo"
}

# This syntax is the only way to assign a single-command environment variable to a sudo-ed command
single_line_correct_sudo_assignment() {
    sudo FOO=lentils env
}

# Neither of these syntaxes correctly pass the FOO environment variable into the sudo-ed command
single_line_incorrect_sudo_assignment() {
    FOO=lentils sudo env
    printf '\n'
    sudo FOO=lentils sudo env
}


#single_line_correct_assignment
#single_line_incorrect_assignment
#single_line_correct_sudo_assignment
single_line_incorrect_sudo_assignment
