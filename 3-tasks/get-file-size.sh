#!/usr/bin/env bash

# - https://unix.stackexchange.com/questions/16640/how-can-i-get-the-size-of-a-file-in-a-bash-script

cd "$(dirname "${BASH_SOURCE[0]}")"

# - du estimates file space usage, so it's no exactly the true size of the file
get_apparent_file_size_in_bytes() {
    du -b 'get-file-size.sh' # 286     get-file-size.sh
}

get_apparent_file_size_in_any_unit() {
    # 6GB     /home/austin/programming/repositories/utcyber/AIFBDP PowerNet Test1/base_plus_attack1a_scada.csv
    du --block-size=GB '/home/austin/programming/repositories/utcyber/AIFBDP PowerNet Test1/base_plus_attack1a_scada.csv'
}

#get_apparent_file_size_in_bytes
get_apparent_file_size_in_any_unit
