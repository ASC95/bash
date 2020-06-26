
# - Use the -i flag for case-insensitive search
# - grepping a log file like this won't show live changes
search_old_log_entries() {
    grep -i "untopchan" /opt/splunk/var/log/splunk/splunkd.log
}

# - I'm forcing tail to start from line 0, then feeding its live stdout to grep!
# - Use the -C flag to print lines of context around matching lines
# - Use the -n flag to show line numbers
search_live_log_entries() {
    tail -n +0 -f /opt/splunk/var/log/splunk/splunkd.log | grep -in -C 2 "untopchan"
}

#search_old_log_entries
search_live_log_entries