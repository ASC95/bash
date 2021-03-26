#!/usr/bin/env bash

# - https://stackoverflow.com/questions/4181703/how-to-concatenate-string-variables-in-bash - describes Bash concatenation operator in general
# - https://unix.stackexchange.com/questions/163898/how-to-assign-a-string-value-to-a-variable-over-multiple-lines-while-indented - describes various
#   ways of declaring multiline strings

# - The easiest way to declare a string (i.e. a variable) across multiple lines is to use the Bash-specific "+=" concatentation operator
declare_multiline_string_variable() {
    long_string="Amazon Kinesis Data Firehose is a fully managed service for delivering real-time streaming data to destinations such as Amazon Simple Storage"
    long_string+=" Service (Amazon S3), Amazon Redshift, Amazon Elasticsearch Service (Amazon ES), Splunk, and any custom HTTP endpoint or HTTP endpoints owned by"
    long_string+=" supported third-party service providers, including Datadog, MongoDB, and New Relic. Kinesis Data Firehose is part of the Kinesis streaming data"
    long_string+=" platform, along with Kinesis Data Streams, Kinesis Video Streams, and Amazon Kinesis Data Analytics. With Kinesis Data Firehose, you don't need"
    long_string+=" to write applications or manage resources."
    printf '~%s~\n' "$long_string"
    printf '\n'
    # - This is the ugly alternative. The indents are shown in the printed string!
    other_string="Amazon Kinesis Data Firehose is a fully managed service for delivering real-time streaming data to destinations such as Amazon Simple Storage \
    Service (Amazon S3), Amazon Redshift, Amazon Elasticsearch Service (Amazon ES), Splunk, and any custom HTTP endpoint or HTTP endpoints owned by \
    supported third-party service providers, including Datadog, MongoDB, and New Relic. Kinesis Data Firehose is part of the Kinesis streaming data \
    platform, along with Kinesis Data Streams, Kinesis Video Streams, and Amazon Kinesis Data Analytics. With Kinesis Data Firehose, you don't need to \
    write applications or manage resources."
    printf '~%s~\n' "$other_string"
}

# - When the -v flag is used, the formatted string arguments are assigned to the variable
#   - I don't like this approach. It's not self-explanatory
print_multiline_string() {
    printf -v my_var '~%s~\n' "Amazon Kinesis Data Firehose is a fully managed service for delivering real-time streaming data to destinations such as Amazon Simple Storage" \
    "Service (Amazon S3), Amazon Redshift, Amazon Elasticsearch Service (Amazon ES), Splunk, and any custom HTTP endpoint or HTTP endpoints owned by" \
    "supported third-party service providers, including Datadog, MongoDB, and New Relic. Kinesis Data Firehose is part of the Kinesis streaming data" \
    "platform, along with Kinesis Data Streams, Kinesis Video Streams, and Amazon Kinesis Data Analytics. With Kinesis Data Firehose, you don't need to" \
    "write applications or manage resources."
    printf '%s\n' "$my_var"

}

# - Faking a multiline string with an array is easy, but I have to remember to expand the array to print it
declare_multiline_string_with_array() {
    long_string=("Amazon Kinesis Data Firehose is a fully managed service for delivering real-time streaming data to destinations such as Amazon Simple Storage"
    "Service (Amazon S3), Amazon Redshift, Amazon Elasticsearch Service (Amazon ES), Splunk, and any custom HTTP endpoint or HTTP endpoints owned by"
    "supported third-party service providers, including Datadog, MongoDB, and New Relic. Kinesis Data Firehose is part of the Kinesis streaming data"
    "platform, along with Kinesis Data Streams, Kinesis Video Streams, and Amazon Kinesis Data Analytics. With Kinesis Data Firehose, you don't need to"
    "write applications or manage resources.")
    printf '%s\n' "$long_string"

}

#declare_multiline_string_variable
#print_multiline_string
declare_multiline_string_with_array