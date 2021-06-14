#!/usr/bin/env bash

# - https://mywiki.wooledge.org/ProcessSubstitution?highlight=%28command%29%7C%28substitution%29

# - Process substitution (i.e. <(<commands>) or >(<commands>) ) has to do with creatings FIFOs
#   - Creating subshells has to do with either command substitution (i.e. $(<commands>) ) or subshell grouping (i.e. (<commands>) )