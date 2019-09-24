#!/usr/bin/env bash

script_elasped_time() {
    sleep 1 # Sleep for 1 second
    printf '%s\n' "Elpased time since script start: $SECONDS" # 1
}

# $RANDOM returns a new random number between 0 and 32767. $RANDOM is a function. It's range cannot be directly manipulated
random_int() {
    printf '%s\n' "Random 1: $RANDOM, Random 2: $RANDOM" # 28169, 12383
}

script_elasped_time
#random_int