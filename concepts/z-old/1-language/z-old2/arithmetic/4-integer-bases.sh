#!/usr/bin/env bash

# - https://mywiki.wooledge.org/ArithmeticExpression?highlight=%28let%29 - some discussion of integer base selection (towards the bottom)
# - https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Arithmetic - some discussion of integer base selection (towards the bottom)

# - Within an arithmetic context, integers with a leading 0 are in octal base
#   - THIS IS ONLY TRUE WITHIN AN ARITHMETIC CONTEXT
# - Within the normal string context, everything is a string anyway
declare_ocatal_base() {
    num=$((077)); echo $num # 63
    string=077; echo $string # 077
}

declare_hex_base() {
    num=$((0x6A)); echo $num # 106
    num=$((0x6a)); echo $num # 106
    string=0x6A; echo $string # 0x6A
}

# - This <base number><number> syntax only works with signless (i.e. positive) numbers
#   - See the first source
#   - If I'm doing a lot of math, use $ bc $ instead of Bash
declare_base_between_2_and_64() {
    # This is base 5
    num=$((5#44)); echo $num # 24
    # This is base 63
    num=$((63#20)); echo $num # 126
}

#declare_ocatal_base
#declare_hex_base
declare_base_between_2_and_64
