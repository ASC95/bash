#!/usr/bin/env bash

# -a: list the full command-line command instead of just the executable file name
get_pid_with_pattern() {
    pgrep -a cri #cribl
}

get_pid_with_pattern