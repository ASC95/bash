# https://askubuntu.com/questions/437182/how-to-check-the-current-value-of-ifs

cd $( dirname ${BASH_SOURCE[0]})
pwd

check_ifs() {
    printf $IFS
}

check_ifs