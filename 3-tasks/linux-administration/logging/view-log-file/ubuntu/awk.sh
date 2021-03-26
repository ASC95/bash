#!usr/bin/env bash

# - https://unix.stackexchange.com/questions/55359/how-to-run-grep-with-multiple-and-patterns

# - Unfortunately, grep doesn't support AND-ing regular expressions in a portable way
#   - I can use multiple grep calls, but who wants to do that?
# - Instead, I can use awk with grep
search_multiple_and_regexes() {
    # This will return lines with "untopchan" and "06-15-2020"
    ls -1 /opt/splunk/var/log/splunk/splunkd.log | xargs grep -i "untopchan" | awk '/untopchan/ && /06-15-2020/ { print; }'
}

search_multiple_and_regexes