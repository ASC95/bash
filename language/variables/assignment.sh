# https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php
# https://www.tldp.org/LDP/abs/html/varassignment.html

# variables are assigned with = (no spaces) and referenced with $
my_var=5
echo "The value of my_var is" $my_var
# Use $(<command>) to execute a command
cwd=$(pwd)
cd ~
echo "We moved to:" $(pwd)
echo "The previous wd was:" $cwd
cd $cwd
echo "We are now back inside of:" $cwd