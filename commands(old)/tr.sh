#!/usr/bin/env bash

# tr normally reads from stdin
transform_characters() {
    printf '%s' 'aaa' | tr 'a' 'b' # bbb
}

transform_characters