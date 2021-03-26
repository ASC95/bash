#!/usr/bin/env bash

# - https://mywiki.wooledge.org/SignalTrap - describes $ trap
# - https://stackoverflow.com/questions/26260581/what-is-the-actual-signal-behind-err - describes ERR

cd "$(dirname "${BASH_SOURCE[0]}")"

# - Signals are a tool for asynchronous process communication
#   - Asynchronous process communication is when the source process, p_1, tells a destination process, p_2, to do something at a time chosen by p_1
# - By contrast, for the destination process to control the timing of the communication, it would have to implement a technique such as checking for a
#   file every few seconds (i.e. "polling")
# - The only information conveyed by a signal to the destination process is what the signal is itself; the destination process doesn't even know who
#   the sent the signal
# - Unless a destination process takes action in advance, most signals will simply terminate the process

# - Instead of simply exiting, a destination process can perform some other action by setting up a signal handler (a.k.a. "trap") in advance
#   - The trap must be set before the signal is received
#   - If a destination process receives a signal for which it has a trap, it has "caught" the signal
#   - Most commonly, traps are used to gracefully clean up a process
#   - Traps can also be used to ignore a signal entirely, but this is usually a terrible idea

# - EXIT, DEBUG, and RETURN are not real signals. They are Bash-isms that make using $ trap $ easier
#   - See $ help trap
# - ERR is even more of a "not real signal." All it does is make trap invoke the provided command(s) in every situation where $ set -e $ would have
#   made the process exit
#   - It is more flexible than $ set -e $ because by itself trapping ERR doesn't cause the process to exit

# - The $ trap $ command can set up a signal handler for the current process (it's quite complex. See the source for more details)
create_signal_handler() {
    # - This set of commands makes trap behave exactly like $ set -e $, which is not a good thing
    #trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

    # - This set of commands just shows where errors occurred, which is great!
    #trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND";' ERR

    # - More concise output. See bash/1-concepts/1-language/variable-types/strings/string-operations/truncate.sh
    trap 's=$?; echo "${0##*/}: Possible error on line "$LINENO": $BASH_COMMAND";' ERR

    echo 'hello'
    # - Triggers the trap, as desired
    #grep 'no' 'nope.txt'
    i=0
    # - Triggers the trap, but unfortunately I didn't want it to trigger. Thus, even a more flexible trap has the same pitfalls as using $ set -e
    ((i++))
    echo 'goodbye'
}

# - An alternative strategy of error handling is to chain grouped commands with the logical && operator
#   - Any non-zero exit code will trigger the failure branch
#   - Since this alternative strategy still seems to have the same pitfalls as $ trap <commands> ERR $, I might as well just use trap
alternative_error_handling() {
    i=0
    {
        echo 'hello' &&
        #grep 'unfortunately' 'nope.txt' &&
        #grep 'unfortunately' '2-signal-trapping.sh' &&
        ((i++)) &&
        echo 'success!'
    } || echo 'failure!'
}

create_signal_handler
#alternative_error_handling
