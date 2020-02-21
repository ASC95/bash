#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# Show the first <num> lines with $ head -n <num>
show_first_lines(){
    man head | head -n 10
}

# Show the last <num> lines with $ tail -n <num>
show_last_lines(){
    man tail | tail -n 10
}

show_first_lines
#show_last_lines