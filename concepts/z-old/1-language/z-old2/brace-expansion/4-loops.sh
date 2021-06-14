#!/usr/bin/env bash

# - https://www.linuxjournal.com/content/bash-brace-expansion

# - Brace expansion offers the ability to created a numeric for-loop with the least amount of typing
counted_for_loop() {
    for i in {1..6..2}; do
        echo $i
    done
}

# - Brace expansion is the only (good) way to write a loop with non-numeric indexes
loop_with_nonnumeric_indexes() {
    for i in {a..d}; do
        echo $i
    done
}

counted_for_loop # 1 3 5
loop_with_nonnumeric_indexes # a b c d
