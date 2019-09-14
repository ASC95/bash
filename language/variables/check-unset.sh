# https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
# https://stackoverflow.com/questions/3427872/whats-the-difference-between-and-in-bash
# https://unix.stackexchange.com/questions/280430/are-the-null-string-and-the-same-string/280432 - "" and a null string are the same thing

# [] is the "test" command.
# [[]] is just like "test", except that I can use &&, &&, and some other operaters inside of it

# ${<variable> + <str>} is a parameter expansion.
# - <variable> is unset: the entire parameter expansion will be substituted with null

# If the NOCACHE is unset, then NOCACHE + x evaluates to null (i.e. empty string) and -z is true (the length of an empty string is zero)
# If NOCACHE is an empty string or something else, NOCACHE + x evaluates to the string "x" and -z is false (the length of "x" is greater than 0)
if [ -z ${NOCACHE+x} ]; 
then 
echo "NOCACHE is unset";
else
echo "NOCACHE is" $NOCACHE;
fi