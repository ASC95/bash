#/usr/bin/env bash

# Does not allow scrolling
last_ten_lines() {
    history | tail -n 10
}

# Does not allow scrolling
first_ten_lines() {
    history | head -n 10
}

scroll_output() {
    # Set the scrolling window size to 10 lines. The default is 1 screenful
    history | less --window=10
}

#last_ten_lines
#first_ten_lines
scroll_output