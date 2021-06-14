#!/usr/bin/env bash

# - https://mywiki.wooledge.org/BashGuide/TestsAndConditionals

cd "$( dirname "${BASH_SOURCE[0]}")"

# - By using the braces to group these statements, the redirection applies to all of the statements collectively
group_statements_to_apply_redirection() {
    {
        printf '%s\n' 'Hello there!'
        printf '%s\n' 'General Kenobi! You are a bold one.'
    } > 'example.txt'
}

# - Sometimes I need to group logical statements together
#   - Don't ever write something this complex in production code. use if-statements instead
# - Both the opening and closing brace SHOULD be surrounded by whitespace 
#   - It seems like only the opening brace needs to have a single whitespace character after it, but that's too obscure to remember
# - The semicolon before the closing brace is required
group_statements_to_evaluate_conditions() {
    # If not A, then C
    # If A and not B, then D
    # If A and B, then E
    condition_a='false'
    condition_b='false'
    $($condition_a) && { $($condition_b) || { printf 'condition D' && exit 0; }; } || { printf '%s\n' 'condition C' && exit 0; } && printf '%s\n' 'condition E'
}

#group_statements_to_apply_redirection
group_statements_to_evaluate_conditions