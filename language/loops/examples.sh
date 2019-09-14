#!/bin/bash 

# https://stackoverflow.com/questions/3005963/how-can-i-have-a-newline-in-a-string-in-sh

for i in {1..1000}
do 
    foo=$"O"
    for i in {1..1000}
    do
        foo+=O
    done;
    echo "$foo"
done; 