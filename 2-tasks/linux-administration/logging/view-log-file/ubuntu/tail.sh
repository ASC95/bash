#!/usr/bin/env bash

# - By default, tail only shows the last 10 lines of a file
#   - That can be changed with the -n flag
#   - Just because only the last x lines are being shown doesn't mean there aren't thousands of earlier log entries!
# - Use the -f flag to view live changes
view_live_log_output() {
    tail -n 20 -f /opt/splunk/var/log/splunk/splunkd.log
}

view_live_log_output