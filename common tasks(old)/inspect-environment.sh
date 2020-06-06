# https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
# https://unix.stackexchange.com/questions/10525/how-to-use-which-on-an-aliased-command - type is better than which

get_linux_os_info() {
    cat /etc/os-release
}

get_linux_os_info