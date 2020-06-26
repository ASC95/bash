cd "$(dirname "${BASH_SOURCE[0]}")"

strip_newline_from_output() {
    #pwd
    pwd | tr -d '\n'
}

strip_newline_from_output